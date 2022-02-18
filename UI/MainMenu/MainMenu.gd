extends Node

enum VIEWS {
	MAIN,
	LEVEL_SELECT,
}
var current_view = VIEWS.MAIN

func view_to_camera_center_pos(view: int):
	match view:
		VIEWS.MAIN:
			return $Main.rect_position
		VIEWS.LEVEL_SELECT:
			return $Stage1LevelSelect.rect_position
		_:
			print("INVALID VIEW, ", view)
			get_tree().quit()

func switch_to_view(view: int):
	$MainMenuCamera.animated_center_on(view_to_camera_center_pos(view))
	
func _ready():
	$MainMenuCamera.center_on(view_to_camera_center_pos(current_view))

func on_exit_button_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func on_start_button_pressed():
	switch_to_view(VIEWS.LEVEL_SELECT)
func on_level_select_back():
	switch_to_view(VIEWS.MAIN)
