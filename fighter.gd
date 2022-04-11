extends KinematicBody2D


export var gravity :float = 400
export var jump_speed :float = 100
var velocity := Vector2()
export var can_turn = true
export var flip_h = false


func _physics_process(delta):
	velocity.y += gravity*delta
	velocity.x = (float(Controller0.is_pressed("right")) - float(Controller0.is_pressed("left")))*100.0
	velocity = move_and_slide(velocity, Vector2.UP)

	$pivot.scale.x = -1.0 if flip_h else 1.0


func jump():
	velocity.y -= jump_speed


func _on_AnimationPlayer_animation_changed(old_name, new_name):
	print("changed from ", old_name, " to ", new_name)
