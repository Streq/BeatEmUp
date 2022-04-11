extends KinematicBody2D


export var gravity :float = 400
export var jump_speed :float = 100
var velocity := Vector2()
export var can_turn = true


onready var anim_tree = $AnimationTree

func _ready():
	$AnimationTree.active = true

func _physics_process(delta):
	velocity.y += gravity*delta
	velocity.x = (float(Controller.is_pressed("right")) - float(Controller.is_pressed("left")))*100.0
	anim_tree.advance(delta)
	velocity = move_and_slide(velocity, Vector2.UP)
	anim_tree.set_condition("jump", is_on_floor() and Controller.is_just_pressed("A"))
#	anim_tree.set_condition("land", is_on_floor())
	anim_tree.set_condition("idle", is_on_floor() and velocity.x == 0 and !is_on_wall())
	anim_tree.set_condition("walk", is_on_floor() and velocity.x != 0)
	anim_tree.set_condition("air", !is_on_floor())
#	anim_tree.set_condition("jab", Controller.is_just_pressed("B"))
	
	if can_turn and velocity.x:
		$pivot.scale.x = sign(velocity.x)
		
	


func jump():
	velocity.y -= jump_speed


func _on_AnimationPlayer_animation_changed(old_name, new_name):
	print("changed from ", old_name, " to ", new_name)
