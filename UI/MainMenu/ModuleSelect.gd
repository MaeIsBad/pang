extends CenterContainer

onready var resume_button := $VBoxContainer/CenterContainer/ResumeGame

var in_game_scn := preload("res://InGame/InGame.tscn")
# emit signal is called directly by the buttons

# warning-ignore:unused_signal
signal module_1_selected
# warning-ignore:unused_signal
signal module_2_selected
# warning-ignore:unused_signal
signal back

func _ready():
	update_resume_game_button_state()

func _enter_tree():
	update_resume_game_button_state()
	
func update_resume_game_button_state():
	if resume_button:
		resume_button.disabled = len(GameSaveManager.saves.saves) == 0
	
func on_resume_game_pressed():
	var save = GameSaveManager.saves.saves.pop_back()
	SceneLoader.resume_game(save)
