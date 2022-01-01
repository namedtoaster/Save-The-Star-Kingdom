extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Transition.intro()

func cave_collapse():
	$Items/Collapse/AnimationPlayer.play("collapse")


func _on_Exit_body_entered(body):
	if body.name == "Player":
		Transition.change_scene("res://Levels/level1/Field.tscn")
