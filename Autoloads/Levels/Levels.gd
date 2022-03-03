extends Node

var allLevels = [
	Level.new("test.1","Test level 1", "res://Maps/Map1.tscn", Level.Difficulty.Easy,6),
	Level.new("test.2","Test level 2", "res://Maps/Map2.tscn", Level.Difficulty.Easy,5),
	Level.new("test.3","Test level 3", "res://Maps/Map3.tscn", Level.Difficulty.Normal,4),
	Level.new("test.4","Test level 4", "res://Maps/Map4.tscn", Level.Difficulty.Normal,3),
	Level.new("test.5","Test level 5", "res://Maps/Map5.tscn", Level.Difficulty.Hard,2),
	Level.new("test.6","Test level 6", "res://Maps/Map6.tscn", Level.Difficulty.Hard,1)
]

var levelsByDifficulty = {
	Level.Difficulty.Easy: [],
	Level.Difficulty.Normal: [],
	Level.Difficulty.Hard: []
}

var levelsById = {}

func update_levels_globals():
	for level in allLevels:
		levelsByDifficulty[level.difficulty].append(level)
		levelsById[level.id] = level
func _ready():
	update_levels_globals()
	
