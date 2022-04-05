extends Node

var buttons := {}

func _ready():
	for button in $buttons.get_children():
		buttons[button.name] = button
