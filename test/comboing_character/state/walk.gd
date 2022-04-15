extends State

func _enter(args):
	var anim = owner.get_node("AnimationPlayer") as AnimationPlayer
	anim.play("walk")

func _physics_update(delta):
	owner.velocity.x = Bool.sign(owner.flip_h) * 100.0
	pass


