extends Node

var allLevels = [
	Level.new("Test level 1", "res://Maps/TestMap.tscn", Level.Difficulty.Easy,6),
	Level.new("Test level 2", "res://Maps/TestMap2.tscn", Level.Difficulty.Easy,5),
	Level.new("Test level 3", "res://Maps/TestMap3.tscn", Level.Difficulty.Normal,4),
	Level.new("Test level 4", "res://Maps/TestMap4.tscn", Level.Difficulty.Normal,3),
	Level.new("Test level 5", "res://Maps/TestMap5.tscn", Level.Difficulty.Hard,2),
	Level.new("Test level 6", "res://Maps/TestMap6.tscn", Level.Difficulty.Hard,1)
]

var levelsByDifficulty = {
	Level.Difficulty.Easy: [],
	Level.Difficulty.Normal: [],
	Level.Difficulty.Hard: []
}

func update_levels_globals():
	for level in allLevels:
		levelsByDifficulty[level.difficulty].append(level)

func _ready():
	update_levels_globals()

# Save player progress
# TODO
func _exit_tree():
	print("saving")
