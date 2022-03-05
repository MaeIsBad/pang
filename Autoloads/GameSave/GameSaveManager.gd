extends Node
const SAVE_FILE := "user://save.res"

const SavesRes := preload("res://Autoloads/GameSave/GameSavesRes.gd")

var saves := SavesRes.new()

func _ready():
	load_from_file()

func save_to_file():
	var result := ResourceSaver.save(SAVE_FILE,saves)
	if result != OK:
		print("Failed to save resource to file, error: %" % result)

func load_from_file():
	print("ASDF")
	if File.new().file_exists(SAVE_FILE):
		var loaded = load(SAVE_FILE) as SavesRes
		if loaded:
			saves = loaded
