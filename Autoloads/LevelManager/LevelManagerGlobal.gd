extends Node

var level_manager_impl: LevelManagerImpl

func set_stage(manager_impl: LevelManagerImpl):
	if level_manager_impl:
		level_manager_impl.free()
	level_manager_impl = manager_impl

func free():
	if level_manager_impl:
		level_manager_impl.free()
	.free()

func load_next():
	level_manager_impl.load_next()
