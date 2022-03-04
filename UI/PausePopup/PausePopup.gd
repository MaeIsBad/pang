extends Control

func _on_pause_popup_close_pressed():
	self.hide()
	get_tree().paused = false

func home_button_pressed():
	SceneLoader.switch_to_main_menu()
	get_tree().paused = false
