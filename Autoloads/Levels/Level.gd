extends Reference
class_name Level

enum Difficulty {
	Easy,
	Normal,
	Hard
}

var name: String
var map_scene: String
var difficulty: int = Difficulty.Easy
var lives = 4
var unlocked = true


func _init(name_: String, map_scene_: String, difficulty_: int, lives: int):
	self.name = name_
	self.map_scene = map_scene_
	self.difficulty = difficulty_
	
func load_map() -> Resource:
	return load(map_scene)
