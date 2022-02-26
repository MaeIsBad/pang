# Abstract class
extends Reference
class_name LevelManagerBase

func get_current_level() -> Level:
	assert(false)
	return null

# Returns null if there are no more levels to load
func next_level() -> Level:
	assert(false)
	return null

# Return the current module number
# Eg. return 1 if this is the module one
# level manager
func get_module_num() -> int:
	assert(false)
	return -1

var map_cache: Resource
func load_map() -> Map:
	if !map_cache:
		map_cache = get_current_level().load_map()
	assert(map_cache != null)
	return map_cache.instance()
