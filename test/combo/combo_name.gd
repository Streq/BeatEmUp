extends Label



func _on_combo(name):
	text = name
	$Timer.start()

func _on_Timer_timeout():
	text = ""
