extends Area2D
class_name Hitbox

export var damage := 0.0
export var knockback := Vector2.ZERO


func apply_damage(body):
	body.health = body.health - damage
func apply_knockback(body):
	var final_knockback = Vector2(knockback.x*owner.facing_dir, knockback.y)
	body.velocity = final_knockback
	pass
