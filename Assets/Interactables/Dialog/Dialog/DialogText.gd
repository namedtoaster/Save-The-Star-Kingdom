# DialogBox.gd
extends RichTextLabel

# Variables
var page = 0

# Functions
func _ready():
	var dialog = owner.dialog
	
	set_bbcode(dialog[page])
	set_visible_characters(0)

func _input(event):
	var dialog = owner.dialog
	
	if InputEventMouseButton && event.is_action_pressed("left_click"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			else:
				page += 1
				
		else:
			set_visible_characters(get_total_character_count())
			
		if page == dialog.size():
			page = 0
			set_bbcode(dialog[page])
			get_owner().disable()
			

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
