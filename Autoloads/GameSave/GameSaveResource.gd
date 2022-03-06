extends Resource
class_name GameSave

export var module: int
export var score: int
export var level_id: String
export var data: Dictionary = {}

func get_level() -> Level:
	return Levels.levelsById[level_id]
