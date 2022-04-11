extends State

func _enter(args):
	var anim = owner.get_node("AnimationPlayer") as AnimationPlayer
	anim.play("walk")

func _physics_update(delta):
	
	var controller = owner.get_node("controller") as Controller
	var dir =  Vector2(float(controller.is_pressed("right")) - float(controller.is_pressed("left")), float(controller.is_pressed("down")) - float(controller.is_pressed("up")))
	
	if !dir.x:
		emit_signal("finish", "idle", null)
		return
	owner.velocity.x = dir.x * 100.0
	owner.flip_h = dir.x<0
