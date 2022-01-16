extends Area2D


func _on_Ladder_body_entered(body):
	if body.name == "Player":
		if (Input.is_action_pressed("up")
			and body.get_node("StateMachine").current_state.name == "Jump"):
			body.ladder_on()
		else:
			body.ladder_ready()
		
func _on_Ladder_body_exited(body):
	if body.name == "Player":
		body.ladder_off()
