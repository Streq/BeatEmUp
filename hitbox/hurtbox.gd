extends Area2D
class_name Hurtbox


func _on_hitbox_entered(area: Hitbox):
	if area.owner != owner:
		owner.get_hit(area)
		area.owner.hit_landed()
