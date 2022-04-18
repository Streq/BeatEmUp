extends State

func _enter(args):
	var anim = owner.get_node("AnimationPlayer") as AnimationPlayer
	anim.play("walk")
	
func _physics_update(delta):
	var flip_h = owner.flip_h
	owner.flip_h = owner.input_state.held_direction.x < 0
	owner.velocity.x = lerp(owner.velocity.x, owner.facing_dir * owner.speed, 10.0*delta)

	if flip_h != owner.flip_h:
		 emit_signal("finish", "idle", null)
