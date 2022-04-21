extends Node
signal goal
signal increment
signal reset

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
		increment()
	else:
		reset()

func _on_hit_landed():
	hit_landed = true
	pass

func _on_got_hit():
	reset()

func reset():
	self.count = 0
	emit_signal("reset")

func increment():
	self.count += 1
	emit_signal("increment")

func set_count(val):
	count = val
#	print(count)
	if count == goal:
		emit_signal("goal")
		count = 0
