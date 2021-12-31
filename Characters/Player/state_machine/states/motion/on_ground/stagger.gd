extends "../motion.gd"

func enter():
	owner.get_node("AnimationPlayer").play("stagger")
	
func update(delta):
	#owner._velocity = Vector2(-1, -1) * speed
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	# Have to specify if this particular animation finishes
	# Otherwise it'll be called when ANY animation finishes
	if anim_name == "stagger":
		._on_animation_finished(anim_name)
