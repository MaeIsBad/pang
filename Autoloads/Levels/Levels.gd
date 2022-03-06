extends Node

var allLevels = [
	Level.new("test.1","Teegarden's Star b", "res://Maps/Map1.tscn", Level.Difficulty.Easy,6),
	Level.new("test.2","TOI 700 d", "res://Maps/Map2.tscn", Level.Difficulty.Easy,5),
	Level.new("test.3","Kepler-1410b", "res://Maps/Map3.tscn", Level.Difficulty.Normal,4),
	Level.new("test.4","TRAPPIST-1d", "res://Maps/Map4.tscn", Level.Difficulty.Normal,3),
	Level.new("test.5","Kepler-1649c", "res://Maps/Map5.tscn", Level.Difficulty.Hard,2),
	Level.new("test.6","Proxima Centauri b", "res://Maps/Map6.tscn", Level.Difficulty.Hard,1),
	Level.new("test.7","Gliese 1061 d", "res://Maps/Map7.tscn", Level.Difficulty.Easy,4),
	Level.new("test.8","Tau Ceti f", "res://Maps/Map8.tscn", Level.Difficulty.Easy,3),
	Level.new("test.9","Luyten b", "res://Maps/Map9.tscn", Level.Difficulty.Normal,2),
	Level.new("test.10","Wolf 1061c", "res://Maps/Map10.tscn", Level.Difficulty.Normal,3),
	Level.new("test.11","Gliese 180 c", "res://Maps/Map11.tscn", Level.Difficulty.Hard,1),
	Level.new("test.12","Kapteyn b", "res://Maps/Map12.tscn", Level.Difficulty.Hard,2),
	Level.new("test.13","K2-296b", "res://Maps/Map13.tscn", Level.Difficulty.Easy,5),
	Level.new("test.14","LHS 1140 b", "res://Maps/Map14.tscn", Level.Difficulty.Easy,4),
	Level.new("test.15","HD 40307 g", "res://Maps/Map15.tscn", Level.Difficulty.Normal,4),
	Level.new("test.16","Gliese 667 Cc", "res://Maps/Map16.tscn", Level.Difficulty.Normal,3),
	Level.new("test.17","Kepler-186f", "res://Maps/Map17.tscn", Level.Difficulty.Hard,2),
	Level.new("test.18","K2-72e", "res://Maps/Map18.tscn", Level.Difficulty.Hard,2),
	Level.new("test.19","Ross 128 b", "res://Maps/Map19.tscn", Level.Difficulty.Hard,1)
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
	
