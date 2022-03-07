class_name Stage1LevelManager
extends LevelManagerBase

var main_menu_scn: PackedScene = load("res://UI/MainMenu/MainMenu.tscn")

var difficulty = Level.Difficulty.Easy

var levels_bag = []
var cur_level: Level

func next_level() -> Level:
	if len(levels_bag) == 0:
		levels_bag = Levels.module1LevelsByDifficulty[difficulty].duplicate(true)
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

func get_module_num() -> int:
	return 1

# Converts an array of levels to an array of their ids
func array_levels_to_level_ids(levels: Array) -> Array:
	var res := []
	for level in levels:
		res.push_back(level.id)
	return res

# Converts an array of level ids to an array of levels
func array_level_ids_to_levels(ids: Array) -> Array:
	var res := []
	for id in ids:
		res.push_back(Levels.levelsById[id])
	return res

func save():
	return {
		"levels_bag": array_levels_to_level_ids(levels_bag),
		"cur_level": cur_level.id,
		"difficulty": difficulty,
	}

func restore(data: Dictionary):
	levels_bag = array_level_ids_to_levels(data["levels_bag"])
	cur_level = Levels.levelsById[data["cur_level"]]
	difficulty = data["difficulty"]
