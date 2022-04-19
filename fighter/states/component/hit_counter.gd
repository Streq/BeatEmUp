extends Node
signal goal


onready var state : State = get_parent()
onready var fighter : Fighter = state.owner

var count = 0 setget set_count
export var goal := 0
var hit_landed = false

func _ready():
	state.connect("entered", self, "_on_entered")
	state.connect("exited", self, "_on_exited")
	fighter.connect("got_hit", self, "_on_got_hit")
	
func _on_entered():
	hit_landed = false
	fighter.connect("hit_landed", self, "_on_hit_landed")
	pass

func _on_exited():
	fighter.disconnect("hit_landed", self, "_on_hit_landed")
	if hit_landed:
		self.count += 1
	else:
		self.count = 0
	print(count)

func _on_hit_landed():
	hit_landed = true
	pass

func _on_got_hit():
	self.count = 0
	pass

func set_count(val):
	count = val
	if count == goal:
		emit_signal("goal")
		count = 0
