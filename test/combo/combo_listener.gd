extends Node

signal combo(name)

export (NodePath) onready var input_buffer = get_node(input_buffer)


func _physics_process(delta):
	for child in get_children():
		if child.check(input_buffer.buffer):
			emit_signal("combo", child.name)
			return
