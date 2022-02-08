extends Node

func on_exit_button_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func on_start_button_pressed():
	$MainMenuCamera.center_on($LevelSelect.rect_position)

func on_start_level_button_pressed():
	get_tree().change_scene("res://UI/InGameUI/InGameUI.tscn")

func on_back_button_pressed():
	$MainMenuCamera.center_on($Main.rect_position)
