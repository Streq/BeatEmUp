extends Node

export (NodePath) onready var controller = get_node(controller) as Controller

#time it takes for the combo buffer to end
onready var combo_timer: Timer = $combo_timer
#window of time for pressing several keys at the same time
onready var simul_press_timer: Timer = $simul_press_timer

#stores combos like ←↓→A+B , ↓↑B
var buffer = ""

var simul_press = false

const input_map = {"up":"u", "down":"d", "left":"l", "right":"r", "A":"A", "B":"B"}

func check():
	for key in input_map:
		if controller.is_just_pressed(key):
			combo_timer.start()
			simul_press_timer.start()
			if simul_press:
				buffer += "+"
			simul_press = true
			buffer += input_map[key]

func _physics_process(delta):
	if combo_timer.is_stopped():
		buffer = ""
	if simul_press_timer.is_stopped():
		simul_press = false
	check()
