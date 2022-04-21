extends AnimState

func _physics_update(delta):
	var dir = owner.input_state.held_direction.x
	if dir:
#		owner.velocity.x = clamp(owner.velocity.x + dir*50.0*delta, -owner.run_speed, owner.run_speed)
		owner.velocity.x = lerp(owner.velocity.x, owner.speed*dir, 2.0 * delta)
#	owner.velocity.x = Math.approach(owner.velocity.x, 0, 1.0 * delta)
	pass
