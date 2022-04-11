extends AnimationTree

onready var _playback = get("parameters/playback")

func set_condition(condition:String, val:bool):
	self["parameters/conditions/"+condition] = val
	
func get_current_animation():
	return _playback.get_current_node()
