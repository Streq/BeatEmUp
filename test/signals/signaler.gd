extends Node

signal A
signal B(param)
signal C(param1,param2)


func _ready():
	print(name)
	emit_signal("A")
	emit_signal("B",1)
	emit_signal("C",1,2)
