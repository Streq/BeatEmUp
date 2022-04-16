extends KinematicBody2D
signal landed
signal air
signal hurt
signal dead
signal resurrected
signal health_changed(proportion)


export var max_health: float = 100
export var health: float = 100 setget set_health
export var gravity: float = 400
export var jump_speed: float = 200
export var can_turn = true
export var flip_h = false

onready var input_state = $input_state
onready var state_machine = $state_machine
var velocity := Vector2()
var dead = false
var facing_dir : float setget ,get_facing_dir


func _ready():
	emit_signal("health_changed", health/max_health)

func _physics_process(delta):
	velocity.y += gravity*delta
	var aux_floor = is_on_floor()
#	print("moving at velocity ", velocity)
	velocity = move_and_slide(velocity, Vector2.UP)
	if aux_floor != is_on_floor():
		if is_on_floor():
			emit_signal("landed")
		else:
			emit_signal("air")

	$pivot.scale.x = -1.0 if flip_h else 1.0

func jump():
	velocity.y -= jump_speed

func step_forward(vel):
	velocity.x += vel*Bool.sign(flip_h)

func get_hit(hitbox: Hitbox):
	hitbox.apply_damage(self)
	hitbox.apply_knockback(self)

func set_health(val: float):
	health = clamp(health, 0.0, max_health)
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
