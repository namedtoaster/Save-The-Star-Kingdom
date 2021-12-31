extends Node

var GUI

# Called when the node enters the scene tree for the first time.
func _ready():
	GUI = get_tree().get_current_scene().get_node("GUI")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
