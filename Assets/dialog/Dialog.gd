extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	disable()

func disable():
	# Disable input
	$CanvasLayer/RichTextLabel.set_process_input(false)
	
	# Remove box
	$CanvasLayer/Polygon2D.visible = false
	
	# Reset text
	$CanvasLayer/RichTextLabel.visible = false
	
	# Reset timer - not sure how to right now
	#$CanvasLayer/Timer.stop()
	
func enable():
	$CanvasLayer/RichTextLabel.set_process_input(true)
	$CanvasLayer/Timer.start()
	$CanvasLayer/Polygon2D.visible = true
	$CanvasLayer/RichTextLabel.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
