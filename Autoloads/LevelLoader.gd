extends Node
var in_game_ui_scn = preload("res://UI/InGameUI/InGameUI.tscn")

func load_level(level: Level):
	var in_game_ui = get_current_scene() as InGameUI
	if !in_game_ui:
		in_game_ui = in_game_ui_scn.instance()
		replace_current_scene_with_node(in_game_ui)
	in_game_ui.set_level(level)

func get_current_scene():
	var root = get_tree().get_root()
	return root.get_child(root.get_child_count() -1)

func replace_current_scene_with_node(node: Node):
	get_current_scene().queue_free()
	get_tree().get_root().add_child(node)