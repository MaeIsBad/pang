extends Node

var in_game_scn := preload("res://InGame/InGame.tscn")

func switch_to_in_game_with_manager(level_manager: LevelManagerBase):
	var in_game: InGame = in_game_scn.instance()
	in_game.level_manager = level_manager
	replace_current_scene_with_node(in_game)

func get_current_scene():
	var root = get_tree().get_root()
	return root.get_child(root.get_child_count() -1)

func replace_current_scene_with_node(node: Node):
	get_current_scene().queue_free()
	get_tree().get_root().add_child(node)
