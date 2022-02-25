class_name Stage1LevelManager
extends LevelManagerBase

var main_menu_scn: PackedScene = load("res://UI/MainMenu/MainMenu.tscn")

var difficulty = Level.Difficulty.Easy

var levels_bag = []
var cur_level: Level

func _init(difficulty_: int):
	difficulty = difficulty_

func next_level() -> Level:
	if len(levels_bag) == 0:
		levels_bag = Levels.levelsByDifficulty[difficulty].duplicate(true)
		# Make sure we don't get the same level twice in a row
		while true:
			levels_bag.shuffle()
			if levels_bag[len(levels_bag) - 1] != cur_level:
				break
	var level = levels_bag.pop_back()
	cur_level = level
	return level

func get_current_level() -> Level:
	if cur_level == null:
		return next_level()
	return cur_level
