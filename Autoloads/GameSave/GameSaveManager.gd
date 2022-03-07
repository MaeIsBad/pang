extends Node

signal saved_games_changed

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
	if File.new().file_exists(SAVE_FILE):
		var loaded = load(SAVE_FILE) as SavesRes
		if loaded:
			saves = loaded

func add_game(game: GameSave):
	self.saves.saves.erase(game)
	self.saves.saves.push_back(game)
	
	emit_signal("saved_games_changed")
	call_deferred("save_to_file")
	
func remove_game(game: GameSave):
	self.saves.saves.erase(game)
	emit_signal("saved_games_changed")
	call_deferred("save_to_file")
