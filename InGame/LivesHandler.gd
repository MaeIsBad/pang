extends Node

signal lost
signal died

var lives: int setget set_lives

onready var in_game := get_parent()
onready var ui := $"../UI"

func _ready():
	Console.remove_command("set_lives")
	Console.add_command("set_lives", self, "command_set_lives")\
	.add_argument("lives", TYPE_INT)\
	.register()
	
func save():
	return {
		"lives": lives
	}
func restore(data: Dictionary):
	self.lives = data["lives"]

func command_set_lives(lives_: int):
	set_lives(lives_)

func set_lives(lives_: int):
	lives = lives_
	ui.set_lives_counter(lives)
	
func on_player_ready(player: Player):
	assert(player.connect("touched_ball", self, "on_player_touched_ball") == OK)

func on_player_touched_ball(_ball):
	self.lives -= 1
	if self.lives == 0:
		emit_signal("lost")
	else:
		emit_signal("died")
		# Reload the current map

func on_level_changed(level: Level):
	self.lives = level.lives

func on_map_changed(map: Map):
	assert(map.connect("player_ready",self,"on_player_ready") == OK)
