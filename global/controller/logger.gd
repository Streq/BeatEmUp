extends Node

export var active := false

func setup():
	var buttons = owner.buttons
	for key in buttons:
		buttons[key].connect("pressed", self, "print_log", [key, "pressed"])
		buttons[key].connect("released", self, "print_log", [key, "released"])

func print_log(key, state):
	if active:
		print(key, ": ", state)
