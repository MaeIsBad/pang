extends Node

# this signal triggered from a button directly
# warning-ignore:unused_signal
signal back


func select_difficulty(diff: int):
	LevelManager.set_stage(Stage1LevelManager.new(diff))
	LevelManager.load_next()
