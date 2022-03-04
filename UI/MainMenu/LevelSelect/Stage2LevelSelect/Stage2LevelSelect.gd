extends Node

# warning-ignore:unused_signal
signal back

var in_game_ui_scn = preload("res://UI/InGameUI/InGameUI.tscn")

var manager := Stage2LevelManager.new()

func get_current_level()-> Level:
	return manager.get_current_level()

func show_level():
	var lvl = get_current_level()
	$HBoxContainer/VBoxContainer/Label.text = lvl.name
	$HBoxContainer/Next.disabled = manager.current_level_idx >= len(manager.level_path)-1
	$HBoxContainer/Prev.disabled = manager.current_level_idx <= 0
	
func _ready():
	show_level()

func next_button_pressed():
	manager.current_level_idx += 1
	show_level()

func prev_button_pressed():
	manager.current_level_idx -= 1
	show_level()
	
func start_button_pressed():
	SceneLoader.switch_to_in_game_with_manager(manager)
