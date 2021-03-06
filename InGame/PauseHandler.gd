extends Node

onready var ui := $"../UI"
onready var pause_menu: PausePopup = ui.pause_popup
onready var in_game := get_parent()



func _ready():
	assert(pause_menu.connect("game_over_button_pressed", self,"on_game_over_button_pressed") == OK)
	assert(pause_menu.connect("home_button_pressed", self,"on_home_button_pressed") == OK)
	assert(pause_menu.connect("pause_close_button_pressed", self,"on_pause_close_button_pressed") == OK)
	

func on_pause_button_pressed():
	get_tree().paused = true
	pause_menu.show()

func on_home_button_pressed():
	get_tree().paused = false
	SceneLoader.switch_to_main_menu()

func on_game_over_button_pressed():
	get_tree().paused = false
	in_game.game_over()

func on_pause_close_button_pressed():
	get_tree().paused = false
	pause_menu.hide()
