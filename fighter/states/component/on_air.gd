extends Node

enum Mode {
	ON_AIR,
	ON_FLOOR
}
export (Mode) var mode := Mode.ON_AIR

#the state to go to
export var state_to := ""

onready var state = get_parent()
onready var fighter = state.owner

func _ready():
	state.connect("physics_updated", self, "_on_physics_updated")

func _on_physics_updated(delta: float):
	if fighter.is_on_floor() == (mode == Mode.ON_FLOOR):
		state.emit_signal("finish", state_to, null)
