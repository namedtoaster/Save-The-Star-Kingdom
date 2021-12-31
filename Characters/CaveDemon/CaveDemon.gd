class_name CaveDemon
extends Character

signal direction_changed(new_direction)

var look_direction = Vector2(1, 0) setget set_look_direction
var target

func _ready():
	speed.x = $StateMachine/Move.MAX_WALK_SPEED
	# TODO remove handle_input calls for this character at some point
	set_process_input(false)

func take_damage(attacker, amount, effect=null):
	if self.is_a_parent_of(attacker):
		return
	$States/Stagger.knockback_direction = (attacker.global_position - global_position).normalized()
	$Health.take_damage(amount, effect)

func set_dead(value):
	set_process_input(not value)
	set_physics_process(not value)
	$CollisionPolygon2D.disabled = value

func set_look_direction(value):
	look_direction = value
	
	# This signal doesn't actually do anything
	#emit_signal("direction_changed", value)

func _on_PlayerDetect_body_entered(body):
	if body.name == "Player":
		target = body.position
		
		$StateMachine._change_state("move")
