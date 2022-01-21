extends Node2D

var num_enemies
onready var exit_col = get_node("Exit").get_node("CollisionShape2D")

func _ready():
	Transition.intro()
	
	# Update enemy count when you kill an enemy
	var player = get_node("Player")
	player.connect("kill", self, "_update_enemies")
	
	# Disable exit until you beat the enemies
	exit_col.call_deferred("set", "disabled", true)
	
func _update_enemies():
	num_enemies = get_tree().get_nodes_in_group("Enemies").size()
	
	# Have to check minus 1 because the enemy won't die until the animation finishes
	if (num_enemies - 1) == 0:
		exit_col.call_deferred("set", "disabled", false)
		$Items/Door.visible = true
