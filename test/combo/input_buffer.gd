extends Node

export (NodePath) onready var controller = get_node(controller) as Controller

#time it takes for the combo buffer to end
onready var combo_timer: Timer = $combo_timer

#window of time for pressing several keys at the same time
const simul_press_frames_threshold = 3
var simul_press_frames = simul_press_frames_threshold


#stores combos like A+B , 623B
var buffer = ""

var simul_press = false

const buttons := ["A", "B"]


# how directions are gonna be represented in the buffer
# ↖ ↑ ↗   7 8 9
# ← · → = 4 5 6
# ↙ ↓ ↘   1 2 3
const dirs := {
		Vector2(-1.0,-1.0): "7", Vector2( 0.0,-1.0): "8", Vector2( 1.0, -1.0): "9",
		Vector2(-1.0, 0.0): "4", Vector2( 0.0, 0.0): "5", Vector2( 1.0,  0.0): "6",
		Vector2(-1.0, 1.0): "1", Vector2( 0.0, 1.0): "2", Vector2( 1.0,  1.0): "3"
	}
var held_direction := Vector2()
func check():
	var direction = controller.get_direction()
	#new direction?
	if direction != held_direction and direction != Vector2.ZERO:
		_update_buffer(dirs[direction])
	held_direction = direction
	for button in buttons:
		if controller.is_just_pressed(button):
			if simul_press:
				buffer += "+"
			_update_buffer(button)
			
func _physics_process(delta):
	if combo_timer.is_stopped():
		buffer = ""
	if simul_press_frames <= 0:
		simul_press = false
	check()
	simul_press_frames -= 1
	
func _update_buffer(input):
	combo_timer.start()
	if simul_press_frames <= 0:
		simul_press_frames = simul_press_frames_threshold
		simul_press = true
	buffer += input
	
