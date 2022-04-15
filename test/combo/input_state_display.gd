extends Label

export (NodePath) onready var input_buffer = get_node(input_buffer)

func _physics_process(delta):
	text = input_buffer.buffer + "\ndirection\n" + str(input_buffer.held_direction)
