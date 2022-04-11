extends Node

onready var state_machine = $another_owner/state_machine
onready var another_owner = $another_owner

func _ready():
	state_machine.owner = another_owner

func _process(delta):
	print("i am ", state_machine.name, " and my owner is: ", state_machine.owner.name)
