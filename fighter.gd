extends KinematicBody2D


export var gravity :float = 400
var velocity := Vector2()

func _physics_process(delta):
	velocity += gravity*delta
	move_and_slide(velocity, Vector2.UP)
