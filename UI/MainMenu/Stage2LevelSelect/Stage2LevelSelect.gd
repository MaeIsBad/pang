extends Node

signal back

var in_game_ui_scn = preload("res://UI/InGameUI/InGameUI.tscn")
onready var level_num = 0 setget set_level

func set_level(num: int):
	assert(num < len(Levels.PATH))
	level_num = num
	show_level()

func get_current_level()-> Level:
	return Levels.PATH[level_num]

func show_level():
	var level_dict = get_current_level()
	$HBoxContainer/VBoxContainer/Label.text = level_dict.name
	$HBoxContainer/Next.disabled = level_num >= len(Levels.PATH)-1
	$HBoxContainer/Prev.disabled = level_num <= 0
	
func _ready():
	show_level()

func next_button_pressed():
	self.level_num += 1

func prev_button_pressed():
	self.level_num -= 1

func start_button_pressed():
	var root = get_tree().get_root()
	
	var current_scene = root.get_child(root.get_child_count() -1)	
	current_scene.queue_free()
	
	var in_game_ui = in_game_ui_scn.instance()
	in_game_ui.set_map(get_current_level().load_map().instance())
	root.add_child(in_game_ui)
