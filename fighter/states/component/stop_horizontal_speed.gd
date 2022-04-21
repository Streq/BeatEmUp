extends Node

export var val := 0.0
export var lerp_val := 60.0 


onready var state = get_parent()
onready var fighter = state.owner


func _ready():
	state.connect("physics_updated",self,"_physics_update")
	
func _physics_update(delta):
#	fighter.velocity.x = val * Bool.sign(fighter.flip_h) 
	fighter.velocity.x = lerp(fighter.velocity.x, val * fighter.facing_dir, delta*lerp_val)
