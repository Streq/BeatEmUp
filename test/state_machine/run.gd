extends State


func _enter(params):
	print("entered run")
	var anim: AnimationPlayer = owner.get_node("AnimationPlayer");
	anim.play("run")

func _physics_update(delta: float):
	if !Input.is_action_pressed("ui_right"):
		emit_signal("finish", "idle", null)
	
