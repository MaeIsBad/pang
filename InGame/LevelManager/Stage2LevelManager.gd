class_name Stage2LevelManager
extends LevelManagerBase

# The order of the levels
var level_path = Levels.module1Levels

var current_level_idx: int = 0 setget set_current_level_idx

func set_current_level_idx(idx: int):
	assert(current_level_idx < len(level_path))
	current_level_idx = idx
	
func get_current_level() -> Level:
	return level_path[current_level_idx]

# Returns null if there are no more levels to load
func next_level() -> Level:
	if self.current_level_idx < len(level_path)-1:
		self.current_level_idx += 1
		return get_current_level()
	else:
		return null
		
func get_module_num() -> int:
	return 2

func save():
	return {
		"current_level": current_level_idx,
	}
func restore(data: Dictionary):
	self.current_level_idx = data["current_level"]
