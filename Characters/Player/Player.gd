class_name Player
extends Character

var ladder = false
var ladder_ready = false

signal direction_changed(new_direction)
signal kill()

var look_direction = Vector2(1, 0) setget set_look_direction
var GUI

func _ready():
	speed.x = $StateMachine/Move.MAX_WALK_SPEED
	GUI = owner.get_node("GUI")

func ladder_ready():
	ladder_ready = true
	
func ladder_on():
	ladder = true
			
	_velocity.y = 0.0
	gravity = 0
	
func ladder_off():
	ladder = false
	ladder_ready = false

func take_damage(attacker, amount, effect=null):
	$AnimationPlayer.play("stagger")
#	if self.is_a_parent_of(attacker):
#		return
	#$States/Stagger.knockback_direction = (attacker.global_position - global_position).normalized()
	#$Health.take_damage(amount, effect)

func set_dead(value):
	set_process_input(not value)
	set_physics_process(not value)
	$CollisionPolygon2D.disabled = value

func set_look_direction(value):
	look_direction = value
	
	# This signal doesn't actually do anything
	#emit_signal("direction_changed", value)

func _input(event):
	if event.is_action_pressed("up"):
		if ladder_ready:
			ladder_on()

func _on_Hitbox_body_entered(body):
	if "CaveDemon" in body.name:
		$StateMachine.current_state.emit_signal("finished", "stagger")
		
		GUI.set_life(-10)


func _on_SwordHitbox_body_entered(body):
	if "CaveDemon" in body.name:
		body.set_dead(true)
		
		GUI.set_magic(20)
		emit_signal("kill")
