class_name InGameUI
extends VSplitContainer

var current_level: Level
# Cache the current map
var current_map: PackedScene
var lives: int setget update_lives

func update_lives(lives_: int):
	lives = lives_	
	$Placeholder/HBoxContainer/LivesLeft.text = String(lives)

func on_player_touched_ball():
	print("Player touched ball")
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
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")

func set_map(map: Map):
	var old_map = $LevelContainer/Viewport.get_child(0)
	old_map.queue_free()
	$LevelContainer/Viewport.add_child(map)

	map.connect("player_touched_ball", self, "on_player_touched_ball")
	map.connect("won", self, "win")
	map.connect("lost", self, "lose")

func set_level(level: Level):
	current_level = level
	current_map = level.load_map()
	self.lives = current_level.lives	
	load_current_map()
