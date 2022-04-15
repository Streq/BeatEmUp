extends Node

#the signal we connect from, emitted by the owner of the state
export var event := ""
#the state to go to
export var state_to := ""

onready var binds = ["finish", state_to, null]
onready var state = get_parent()
onready var fighter = state.owner

func _ready():
	state.connect("entered",self,"_on_entered")
	state.connect("exited",self,"_on_exited")
	

func _on_entered():
	fighter.connect(event, state, "emit_signal", binds)


func _on_exited():
	fighter.disconnect(event, state, "emit_signal")
