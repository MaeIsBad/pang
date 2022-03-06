extends "res://MapElements/Drops/Drop.gd"

func _ready():
	assert(connect("player_picked_up", self, "on_player_picked_up") == OK)

func on_player_picked_up(_player: Player):
	for ball in get_tree().get_nodes_in_group("Balls"):
		ball.call_deferred("freeze", 2.0)
