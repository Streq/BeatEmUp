extends Sprite


export (NodePath) onready var input_buffer = get_node(input_buffer)

func _physics_process(delta):
	$joystick.position = input_buffer.held_direction.normalized() * 28.0
	$A.self_modulate = Color.gray if input_buffer.controller.is_pressed("A") else Color.white 
	$B.self_modulate = Color.gray if input_buffer.controller.is_pressed("B") else Color.white 
