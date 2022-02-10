extends Node

func on_exit_button_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func on_start_button_pressed():
	$MainMenuCamera.center_on($LevelSelect.rect_position)

func on_level_select_back():
	$MainMenuCamera.center_on($Main.rect_position)
