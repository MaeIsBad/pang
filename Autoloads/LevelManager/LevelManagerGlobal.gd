extends Node

var level_manager_impl: LevelManagerImpl

func set_stage(manager_impl: LevelManagerImpl):
	level_manager_impl = manager_impl

func load_next():
	level_manager_impl.load_next()

func lose():
	level_manager_impl.lose()
