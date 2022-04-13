extends Node
class_name Controller

func is_pressed(name: String) -> bool:
	return false

func is_just_released(name: String) -> bool:
	return false

func is_just_pressed(name: String) -> bool:
	return false

func get_direction() -> Vector2:
	return Bool.vec2(is_pressed("right"), is_pressed("left"), is_pressed("down"), is_pressed("up"))
