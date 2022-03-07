extends "res://MapElements/Drops/Drop.gd"

const ball_bounce_modifier := preload("res://MapElements/Drops/BallBounceIncreaseDrop/BallIncreaseBounceModifier.gd")
export var bounce_multiplier: float = 2
export var duration: float = 10.0

func _ready():
	connect("player_picked_up", self, "on_player_picked_up")

func on_player_picked_up(_player: Player):
	for ball in get_tree().get_nodes_in_group("Balls"):
		ball_bounce_modifier.new(ball, bounce_multiplier, duration)
