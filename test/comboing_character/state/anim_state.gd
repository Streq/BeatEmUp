extends State
class_name AnimState


export var animation := ""
export var state_on_anim_finish := ""

onready var anim = owner.get_node("AnimationPlayer") as AnimationPlayer

func _enter(args):
	call_deferred("_enter_deferred", args)

func _enter_deferred(args):
	anim.play("RESET")
	anim.advance(0)
	anim.play(animation)
	anim.advance(0)
	if state_on_anim_finish:
		anim.connect("animation_finished", self, "_on_animation_finished")

	
func _exit():
	if state_on_anim_finish:
		anim.disconnect("animation_finished", self, "_on_animation_finished")
	
func _on_animation_finished(name: String):
	emit_signal("finish", state_on_anim_finish, null)
