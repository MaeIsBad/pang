extends Node

enum VIEWS {
	MAIN = 0,
	LEVEL_SELECT_1 = 1,
	MODULE_SELECT = 2,
	LEVEL_SELECT_2 = 3,
	SCOREBOARD = 4,
	SAVE = 5
}
var current_view = VIEWS.MAIN

func view_to_camera_center_pos(view: int):
	match view:
		VIEWS.MAIN:
			return $MainScreen.rect_position
		VIEWS.LEVEL_SELECT_1:
			return $Stage1LevelSelect.rect_position
		VIEWS.LEVEL_SELECT_2:
			return $Stage2LevelSelect.rect_position
		VIEWS.MODULE_SELECT:
			return $ModuleSelect.rect_position
		VIEWS.SCOREBOARD:
			return $Scoreboard.rect_position
		VIEWS.SAVE:
			return $SavedGamesView.rect_position
		_:
			print("INVALID VIEW, ", view)
			get_tree().quit()

func switch_to_view(view: int):
	$MainMenuCamera.animated_center_on(view_to_camera_center_pos(view))
	
func _ready():
	$MainMenuCamera.center_on(view_to_camera_center_pos(current_view))
