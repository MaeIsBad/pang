extends Node

class_name InGame

signal level_changed(level)
signal map_changed(map)

signal won
signal died
signal lost

var current_level: Level
# Cache the current map
var current_map: PackedScene
var lives: int setget set_lives

onready var ui := $UI

func _ready():
	Console.remove_command("set_lives")
	Console.add_command("set_lives", self, "command_set_lives")\
	.add_argument("lives", TYPE_INT)\
	.register()

func command_set_lives(lives_: int):
	set_lives(lives_)

func set_lives(lives_: int):
	lives = lives_	
	ui.set_lives_counter(lives)

func on_player_touched_ball():
	self.lives -= 1
	if self.lives == 0:
		lose()
	else:
		emit_signal("died")
		# Reload the current map
		load_current_map()

func win():
	emit_signal("won")
	LevelManager.load_next()

func lose():
	emit_signal("lost")
	LevelManager.lose()

func load_current_map():
	set_map(current_map.instance())

func set_map(map: Map):
	ui.set_map(map)
	assert(map.connect("player_touched_ball", self, "on_player_touched_ball") == OK)
	assert(map.connect("won", self, "win") == OK)
	emit_signal("map_changed",map)

func set_level(level: Level):
	current_level = level
	current_map = level.load_map()
	self.lives = current_level.lives
	emit_signal("level_changed",level)
	load_current_map()
	
