extends Area2D


export(String) var EXIT_SCENE


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Exit_body_entered(body):
	if body.name == "Player":
		Transition.change_scene(EXIT_SCENE)
