extends KinematicBody2D


export var gravity :float = 400
export var jump_speed :float = 400
var velocity := Vector2()

func _ready():
	$AnimationTree.active = true

func _physics_process(delta):
	velocity.y += gravity*delta
	velocity.x = (float(Controller.is_pressed("right")) - float(Controller.is_pressed("left")))*100.0
	if velocity.x:
		$pivot.scale.x = sign(velocity.x)
	velocity = move_and_slide(velocity, Vector2.UP)
	set_anim_condition("jump", is_on_floor() and Controller.is_just_pressed("A"))
	set_anim_condition("land", is_on_floor())
	set_anim_condition("idle", is_on_floor() and velocity.x == 0 and !is_on_wall())
	set_anim_condition("walk", is_on_floor() and velocity.x != 0)
	set_anim_condition("air", !is_on_floor())
	set_anim_condition("jab", Controller.is_just_pressed("B"))

func set_anim_condition(condition:String, val:bool):
	$AnimationTree["parameters/conditions/"+condition] = val

func jump():
	velocity.y -= jump_speed
