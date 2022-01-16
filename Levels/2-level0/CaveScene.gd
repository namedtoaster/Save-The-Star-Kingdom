extends Node2D

func _ready():
	Transition.intro()

func cave_collapse():
	$Items/Collapse/AnimationPlayer.play("collapse")
	
func dialog_action(action):
	match action:
		"staff":
			cave_collapse()
