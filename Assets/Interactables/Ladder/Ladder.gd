extends Area2D


func _on_Ladder_body_entered(body):
	if body.name == "Player":
		if (Input.is_action_pressed("up") 
			and body.get_node("StateMachine").current_state.name == "Jump")
			or :
			body.ladder = true
			
			body._velocity.y = 0.0
			body.gravity = 0
		
func _on_Ladder_body_exited(body):
	if body.name == "Player":
		body.ladder = false
