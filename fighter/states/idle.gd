extends State

func _enter(args):
	var anim = owner.get_node("AnimationPlayer") as AnimationPlayer
	anim.play("idle")

func _physics_update(delta):
	var p = owner
	var controller = p.get_node("controller") as Controller
	var dir =  Vector2(float(controller.is_pressed("right")) - float(controller.is_pressed("left")), float(controller.is_pressed("down")) - float(controller.is_pressed("up")))
	if dir.x:
		emit_signal("finish", "walk", dir.x)
