extends Node2D


export(NodePath) var DIALOG_NODE
export(String) var DIALOG_ACTION


func _on_DialogItem_body_entered(body):
	if body.name == "Player":
		if DIALOG_NODE != "":
			var dialog = get_node(DIALOG_NODE)
			dialog.enable()
			
			if DIALOG_ACTION != "":
				get_tree().get_current_scene().dialog_action(DIALOG_ACTION)
