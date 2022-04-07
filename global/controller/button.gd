extends Node
signal pressed
signal released

export (String) var action
var pressed = false setget set_pressed
var just_updated = false

func set_pressed(val):
	just_updated = pressed != val
	pressed = val
	if just_updated:
		if pressed:
			emit_signal("pressed")
		else:
			emit_signal("released")

func _input(event):
	if event.is_action(action):
		self.pressed = event.is_pressed()

func _physics_process(delta):
	just_updated = false
