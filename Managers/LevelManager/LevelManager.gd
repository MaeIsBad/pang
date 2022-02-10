extends Node

var PATH = [
	Level.new("Test level 1", "res://Maps/TestMap.tscn"),
	Level.new("Test level 2", "res://Maps/TestMap2.tscn"),
]

# Save player progress
# TODO
func _exit_tree():
	print("saving")
