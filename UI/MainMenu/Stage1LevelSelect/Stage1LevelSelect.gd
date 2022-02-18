extends Node

signal back


func select_difficulty(diff: int):
	LevelManager.set_stage(Stage1LevelManager.new(diff))
	LevelManager.load_next()
