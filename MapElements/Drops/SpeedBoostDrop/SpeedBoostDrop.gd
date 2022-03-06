extends "res://MapElements/Drops/Drop.gd"

const SpeedBoostModifier := preload("res://MapElements/Drops/SpeedBoostDrop/SpeedBoostModifier.gd")
export var speed_multiplier := 1.4
export var powerup_duration := 5.0

func _ready():
	assert(connect("player_picked_up", self, "on_player_picked_up") == OK)

func on_player_picked_up(player: Player):
	var modifier := SpeedBoostModifier.new(player, speed_multiplier, powerup_duration)
