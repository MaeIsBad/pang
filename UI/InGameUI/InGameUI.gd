class_name InGameUI
extends VSplitContainer

var current_level: Level
# Cache the current map
var current_map: PackedScene
var lives: int setget update_lives

func _ready():
	Console.remove_command("set_lives")
	Console.add_command("set_lives", self, "command_set_lives")\
	.add_argument("lives", TYPE_INT)\
	.register()

func command_set_lives(lives_: int):
	self.lives = lives_

func update_lives(lives_: int):
	lives = lives_	
	$Placeholder/HBoxContainer/LivesLeft.text = String(lives)

func on_player_touched_ball():
	self.lives -= 1
	if self.lives == 0:
		lose()
	else:
		# Reload the current map
		load_current_map()

func load_current_map():
	set_map(current_map.instance())

func win():
	LevelManager.load_next()

func lose():
	assert(get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn") == OK)

func set_map(map: Map):
	var old_map = $LevelContainer/Viewport.get_child(0)
	old_map.queue_free()
	$LevelContainer/Viewport.call_deferred("add_child", map)

	assert(map.connect("player_touched_ball", self, "on_player_touched_ball") == OK)
	assert(map.connect("won", self, "win") == OK)

func set_level(level: Level):
	current_level = level
	current_map = level.load_map()
	self.lives = current_level.lives	
	load_current_map()
