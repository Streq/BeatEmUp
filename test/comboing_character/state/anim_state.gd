extends State

export var animation := ""
export var state_on_anim_fnish := ""

onready var anim = owner.get_node("AnimationPlayer") as AnimationPlayer

func _enter(args):
	anim.play(animation)
	if state_on_anim_fnish:
		anim.connect("animation_finished", self, "_on_animation_finished")

func _exit():
	if state_on_anim_fnish:
		anim.disconnect("animation_finished", self, "_on_animation_finished")
	
func _on_animation_finished(name: String):
	emit_signal("finish", state_on_anim_fnish, null)
