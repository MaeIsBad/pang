extends "res://MapElements/Drops/Drop.gd"

export var speed_boost_duration := 5.0
export var speed_multiplier := 1.25

func _ready():
	assert(connect("player_picked_up", self, "on_player_picked_up") == OK)

func on_player_picked_up(player: Player):
	player.emit_signal("picked_up_life_powerup")
