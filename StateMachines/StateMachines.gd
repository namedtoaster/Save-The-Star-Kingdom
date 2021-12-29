extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Transition.intro()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$GUI/StatesStack/States.text = ""
	var i = 1
	for state in $Player/StateMachine.states_stack:
		$GUI/StatesStack/States.text += str(i) + ": " + state.name + "\n"
		i += 1
