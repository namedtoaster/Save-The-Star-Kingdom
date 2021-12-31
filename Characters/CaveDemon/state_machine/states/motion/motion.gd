# Collection of important methods to handle direction and animation
extends "../state.gd"

var speed = 0.0
var move_amount = 0.0

export(float) var MAX_WALK_SPEED = 300
export(float) var MAX_RUN_SPEED = 200

func handle_input(event):
#	if event.is_action_pressed("simulate_damage"):
#		emit_signal("finished", "stagger")
	return .handle_input(event)

func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	#input_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return input_direction

func update_look_direction(direction):
	pass
	#owner.get_node("BodyPivot").set_scale(Vector2(direction.x, 1))
	
func update(delta):
	owner.move_and_collide(move_amount) # or move_and_slide(move_amount / delta)
		
	.update(delta)
			
func _on_animation_finished(anim_name):
	pass
