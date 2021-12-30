# Collection of important methods to handle direction and animation
extends "../state.gd"

var speed = 0.0

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
	# For every state that inherits from motion.gd, update the look direction
	#var input_direction = get_input_direction()
	#update_look_direction(input_direction)
	
	# Always apply gravity, whether you are on the ground or not - will be applied in the on_ground state(s) as well
	#owner.move_and_slide(owner._velocity, Vector2.UP, true)
	
	# Zero out the y component of velocity in order to be able to jump (and to prevent jumping when hitting the ceiling)
	# Otherwise, the y velocity will continue to increase and jumping will be ineffective (and if you're jumping you'll stick to the bottom of floors temporarily)
	#if (owner.is_on_floor() or owner.is_on_ceiling()):
	#	owner._velocity.y = 0.0
		
	.update(delta)
			
func _on_animation_finished(anim_name):
	pass
