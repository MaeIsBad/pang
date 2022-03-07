extends VBoxContainer

# warning-ignore:unused_signal
signal back

const save_view_scn := preload("res://UI/MainMenu/SavedGamesView/SaveView.tscn")
onready var save_view_container := $ScrollContainer/SaveViewContainer

func _ready():
	assert(GameSaveManager.connect("saved_games_changed",self,"show_saves", [], CONNECT_DEFERRED) == OK)
	call_deferred("show_saves")
func show_saves():
	for child in save_view_container.get_children():
		save_view_container.remove_child(child)
		child.queue_free()
	for save in GameSaveManager.saves.saves:
		var save_view := save_view_scn.instance()
		save_view.save = save
		save_view_container.call_deferred("add_child", save_view)
