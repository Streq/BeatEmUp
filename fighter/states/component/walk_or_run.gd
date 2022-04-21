extends Node

export var velocity := 100.0 


onready var state = get_parent()
onready var fighter = state.owner


func _ready():
	state.connect("entered",self,"_entered")

func _entered():
	state.state_on_anim_finish = "walk" if abs(fighter.velocity.x) <= fighter.speed else "run"
