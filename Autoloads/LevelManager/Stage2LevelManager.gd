class_name Stage2LevelManager
extends LevelManagerImpl

var game_over_scn := preload("res://UI/Stage2GameOverUI/Stage2GameOverUI.tscn")

# The order of the levels
var level_path = Levels.allLevels

var current_level_idx: int = 0 setget set_current_level_idx

func set_current_level_idx(idx: int):
	assert(current_level_idx < len(level_path))
	current_level_idx = idx
	
func get_current_level():
	return level_path[current_level_idx]
	
func load_current():
	LevelLoader.load_level(get_current_level())

func load_next():
	if self.current_level_idx < len(level_path)-1:
		self.current_level_idx += 1
		LevelLoader.load_level(get_current_level())
	else:
		game_over()
func lose():
	game_over()

func game_over():
	LevelLoader.replace_current_scene_with_node(game_over_scn.instance())
