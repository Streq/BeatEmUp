extends Node

func _ready():
	print(name)
	get_parent().connect("A",self,"_on_signaler_A")
	for s in get_incoming_connections():
		var source = s.source
		var signal_name = s.signal_name
		var method_name = s.method_name
		print(s)


func _on_signaler_A():
	print("signal A arrived")


func _on_signaler_B():
	print("signal B arrived")


func _on_signaler_C():
	print("signal C arrived")

func _on_signaler_A2_params(a,b):
	print("signal A arrived with args: ", a, ", ", b)
