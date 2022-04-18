extends KinematicBody2D
signal landed
signal air
signal hurt
signal dead
signal resurrected
signal hit_wall
signal left_wall
signal health_changed(proportion)
signal controller_changed(new_controller)

export var max_health: float = 100
export var health: float = 100 setget set_health
export var gravity: float = 400
export var jump_speed: float = 200
export var speed: float = 100
export var run_speed: float = 200
export var can_turn = true
export var flip_h = false
var stunned = 0

onready var input_state = $input_state
onready var state_machine = $state_machine
onready var controller: Controller = $controller if has_node("controller") else Controller.new() setget set_controller
onready var animation: AnimationPlayer = $AnimationPlayer
var velocity := Vector2()
var dead = false
var facing_dir : float setget ,get_facing_dir

func _ready():
	set_health(health)
	set_controller(controller)

func set_controller(val: Controller):
	controller = val
	emit_signal("controller_changed", controller)

func _physics_process(delta):
	velocity.y += gravity*delta
	var aux_floor = is_on_floor()
	var aux_wall = is_on_wall()
#	print("moving at velocity ", velocity)
	if !stunned:
		velocity = move_and_slide(velocity, Vector2.UP)
		if aux_floor != is_on_floor():
			if is_on_floor():
				emit_signal("landed")
			else:
				emit_signal("air")
		if aux_wall != is_on_wall():
			if is_on_wall():
				emit_signal("hit_wall")
			else:
				emit_signal("left_wall")

		$pivot.scale.x = -1.0 if flip_h else 1.0
		state_machine.physics_update(delta)
		animation.advance(delta)

func jump():
	velocity.y -= jump_speed

func step_forward(vel):
	velocity.x += vel*Bool.sign(flip_h)

const histstun = 10.0/60.0

func get_hit(hitbox: Hitbox):
	state_machine._change_state("hurt", null)
	hitbox.apply_damage(self)
	hitbox.apply_knockback(self)
	stunned += 1
	yield(get_tree().create_timer(histstun),"timeout")
	stunned -= 1
	
func hit_landed():
	stunned += 1
	yield(get_tree().create_timer(histstun),"timeout")
	stunned -= 1

func set_health(val: float):
	health = clamp(val, 0.0, max_health)
	emit_signal("health_changed", health/max_health)
	if health == 0:
		die()
	elif dead:
		resurrect()

func die():
	dead = true
	emit_signal("dead")
	if is_on_floor():
		state_machine._change_state("dead", null)
	else:
		state_machine._change_state("dead_air", null)
	
func resurrect():
	dead = false
	emit_signal("resurrected")

func get_facing_dir():
	return Bool.sign(flip_h)
