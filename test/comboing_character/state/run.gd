extends State

func _enter(args):
	var anim = owner.get_node("AnimationPlayer") as AnimationPlayer
	anim.play("run")
	owner.flip_h = owner.input_state.held_direction.x < 0


func _physics_update(delta):
	owner.velocity.x = Bool.sign(owner.flip_h) * 200.0
	pass

