extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_life(value):
	var new_val
	$VBoxContainer/LifeBar.get_node("TextureProgress").value += value
	new_val = $VBoxContainer/LifeBar.get_node("TextureProgress").value
	
	$VBoxContainer/LifeBar.get_node("Count/Background/Number").text = str(new_val)
	
func set_magic(value):
	var new_val
	$VBoxContainer/MagicBar.get_node("TextureProgress").value += value
	new_val = $VBoxContainer/MagicBar.get_node("TextureProgress").value
	
	$VBoxContainer/MagicBar.get_node("Count/Background/Number").text = str(new_val)
