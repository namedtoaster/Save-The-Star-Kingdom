extends Node2D


export(NodePath) var DIALOG_NODE


func _on_dialog_item_body_entered(body):
	if body.name == "Player":
		if DIALOG_NODE != "":
			var dialog = get_node(DIALOG_NODE)
			dialog.enable()
			
			get_tree().get_current_scene().cave_collapse()
