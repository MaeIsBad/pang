extends VBoxContainer
const save_view_scn := preload("res://UI/MainMenu/SavedGamesView/SaveView.tscn")
onready var save_view_container := $ScrollContainer/SaveViewContainer

func _ready():
	for save in GameSaveManager.saves.saves:
		var save_view := save_view_scn.instance()
		save_view.save = save
		save_view_container.call_deferred("add_child", save_view)

func _exit_tree():
	GameSaveManager.save_to_file()
