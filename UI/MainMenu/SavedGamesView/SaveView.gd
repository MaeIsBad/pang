extends HBoxContainer

var save: GameSave

onready var label := $Label

func _ready():
	label.text = label.text.format({
		"module": save.module,
		"score": save.score,
		"map": save.get_level().name,
	})

func on_play_button_pressed():
	GameSaveManager.remove_game(save)
	SceneLoader.resume_game(save)

func on_delete_button_pressed():
	GameSaveManager.remove_game(save)
