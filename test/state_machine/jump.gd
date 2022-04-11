extends State

func _enter(params):
	print("entered jump")
	var anim : AnimationPlayer = owner.get_node("AnimationPlayer")
	anim.connect("animation_finished", self, "_on_animation_finished")
	anim.play("jump")

func _on_animation_finished(name:String):
	var anim : AnimationPlayer = owner.get_node("AnimationPlayer")
	anim.disconnect("animation_finished", self, "_on_animation_finished")
	if Input.is_action_pressed("ui_right"):
		emit_signal("finish", "run", null)
	else:
		emit_signal("finish", "idle", null)
