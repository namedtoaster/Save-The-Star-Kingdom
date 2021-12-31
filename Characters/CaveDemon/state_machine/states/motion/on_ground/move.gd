extends "on_ground.gd"

func enter():
	speed = 15.0

func handle_input(event):
	return .handle_input(event)

func update(delta):
	if owner.set_target:
		var target = owner.target
		var position = owner.position
		
		var dir = (target - position).normalized()
		move_amount = dir * speed
	
	.update(delta)

#func move(speed, direction):
#	owner._velocity = direction.normalized() * speed
#	#owner.move_and_slide(velocity, Vector2(), 5, 2)
#	if owner.get_slide_count() == 0:
#		return
#	return owner.get_slide_collision(0)
