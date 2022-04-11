extends State


func _enter(params):
	print("entered idle")
	owner.get_node("AnimationPlayer").play("idle")

func _physics_update(delta: float):
	if Input.is_action_just_pressed("A"):
		emit_signal("finish", "jump", null)
	elif Input.is_action_pressed("ui_right"):
		emit_signal("finish", "run", null)
