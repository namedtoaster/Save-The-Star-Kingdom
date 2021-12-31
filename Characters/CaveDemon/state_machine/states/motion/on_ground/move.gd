extends "on_ground.gd"

func enter():
	speed = 10.0

func handle_input(event):
	return .handle_input(event)

func update(delta):
	var target = owner.target
	var position = owner.position
	
	var dir = (target - position).normalized()
	move_amount = Vector2(move_toward(position.x, target.x, dir.x * speed  * delta), move_toward(position.y, target.y, dir.y * speed * delta))
	#move_and_collide(move_amount) # or move_and_slide(move_amount / delta)
	
	.update(delta)


func move_toward(orig : float, target : float, amount : float) -> float:
		var result : float

		if abs(orig - target) <= amount:
			result = target
		elif orig < target:
			result = min(orig + amount, target)
		elif orig > target:
			result = max(orig - amount, target)
		return result

#func move(speed, direction):
#	owner._velocity = direction.normalized() * speed
#	#owner.move_and_slide(velocity, Vector2(), 5, 2)
#	if owner.get_slide_count() == 0:
#		return
#	return owner.get_slide_collision(0)
