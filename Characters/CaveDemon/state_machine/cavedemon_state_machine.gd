extends "state_machine.gd"

func _ready():
	set_process_input(false)
	states_map = {
		"idle": $Idle,
		"move": $Move,
		#"stagger": $Stagger,
		"attack": $Attack
	}

func _change_state(state_name):
	"""
	The base state_machine interface this node extends does most of the work
	"""
	
	if not _active:
		return
	if state_name in ["stagger", "jump", "attack"]:
		states_stack.push_front(states_map[state_name])
	if state_name == "jump" and current_state == $Move:
		$Jump.initialize($Move.speed, owner._velocity)
	._change_state(state_name)

func _input(event):
	"""
	Here we only handle input that can interrupt states, attacking in this case
	otherwise we let the state node handle it
	"""
#	if event.is_action_pressed("attack"):
#		# Cannot attack while jumping
#		if current_state == $Attack or current_state == $Jump:
#			return
#		_change_state("attack")
#		return
#	current_state.handle_input(event)
	pass
	
