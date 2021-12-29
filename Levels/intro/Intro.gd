extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Transition.intro()
	$Rain.set_emitting(true)

func _on_Timer2_timeout():
	$AnimationPlayer.play("MoveRight")


func _on_Timer3_timeout():
	Transition.change_scene("res://Levels/intro/Intro2.tscn")
