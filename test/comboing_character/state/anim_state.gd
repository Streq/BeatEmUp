extends State

export var animation := ""

func _enter(args):
	var anim = owner.get_node("AnimationPlayer") as AnimationPlayer
	anim.play(animation)

