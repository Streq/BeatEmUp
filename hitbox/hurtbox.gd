extends Area2D
class_name Hurtbox


func _on_hitbox_entered(area: Hitbox):
	owner.get_hit(area)
