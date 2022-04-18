extends Controller

export var id := 0

onready var controller = get_node("/root/Controllers/"+str(id))

func is_pressed(name: String) -> bool:
	return controller.is_pressed(name)

func is_just_released(name: String) -> bool:
	return controller.is_just_released(name)

func is_just_pressed(name: String) -> bool:
	return controller.is_just_pressed(name)
