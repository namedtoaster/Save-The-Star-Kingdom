extends Node2D


export(NodePath) var DIALOG_NODE


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_Staff_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		if DIALOG_NODE != "":
			var dialog = get_node(DIALOG_NODE)
			dialog.enable()
			
			get_tree().get_current_scene().cave_collapse()
