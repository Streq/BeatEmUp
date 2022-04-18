extends Controller

var buttons := {}

func _ready():
	for button in $buttons.get_children():
		buttons[button.name] = button
		button.action = (button.action if button.action else button.name)+name

func is_pressed(name:String) -> bool:
	return buttons[name].pressed

func is_just_released(name:String) -> bool:
	var b = buttons[name]
	return !b.pressed and b.just_updated

func is_just_pressed(name:String) -> bool:
	var b = buttons[name]
	return b.pressed and b.just_updated

