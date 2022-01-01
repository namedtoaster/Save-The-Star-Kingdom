extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Transition.intro()

func cave_collapse():
	$Items/Collapse/AnimationPlayer.play("collapse")
