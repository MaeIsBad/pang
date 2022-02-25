extends Node

# this signal triggered from a button directly
# warning-ignore:unused_signal
signal back


func select_difficulty(diff: int):
	SceneLoader.switch_to_in_game_with_manager(Stage1LevelManager.new(diff))
