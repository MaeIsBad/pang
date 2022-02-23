class_name Stage1LevelManager
extends LevelManagerImpl

var main_menu_scn: PackedScene = load("res://UI/MainMenu/MainMenu.tscn")

var difficulty = Level.Difficulty.Easy

var levels_bag = []
var prev_level: Level

func _init(difficulty_: int):
	difficulty = difficulty_

func get_next_level():
	if len(levels_bag) == 0:
		levels_bag = Levels.levelsByDifficulty[difficulty].duplicate(true)
		# Make sure we don't get the same level twice in a row
		while true:
			levels_bag.shuffle()
			if levels_bag[len(levels_bag) - 1] != prev_level:
				break
	var level = levels_bag.pop_back()
	prev_level = level
	return level
	
func load_next(): 
	LevelLoader.load_level(get_next_level())
	
func lose():
	LevelLoader.replace_current_scene_with_node(main_menu_scn.instance())
