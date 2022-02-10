extends Reference
class_name Level

var name: String
var map_scene: String
var unlocked = true

func _init(name_: String, map_scene_: String):
	self.name = name_
	self.map_scene = map_scene_
	
func load_map() -> Resource:
	return load(map_scene)
