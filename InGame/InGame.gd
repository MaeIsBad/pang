extends Node

class_name InGame

signal level_changed(level)
signal map_changed(map)
signal won

# Level manager needs to be set by an external
# script before adding this scene to the tree
var level_manager: LevelManagerBase

var current_map: Map
# Used so we don't save a finished game
var is_game_over := false

var game_over_scn := preload("res://UI/GameOver/GameOver.tscn")

onready var ui := $UI
onready var score_handler := $ScoreHandler
onready var lives_handler := $LivesHandler
func _ready():
	Console.remove_command("save")
	Console.add_command("save", self, "command_save")\
	.register()
	
	Console.remove_command("load")
	Console.add_command("load", self, "command_load")\
	.register();

func set_level_manager(level_manger_: LevelManagerBase):
	level_manager = level_manger_
	set_level(level_manager.get_current_level())

var save_data: GameSave
func command_save():
	save_data = save()
	
func command_load():
	restore(save_data)

func save() -> GameSave:
	var s := GameSave.new()
	s.level_id = self.level_manager.get_current_level().id
	s.score = score_handler.score
	s.module = level_manager.get_module_num()
	s.data = {
		"map": current_map.save(),
		"level_manager_data": level_manager.save(),
		"level_manager_script": level_manager.get_script().get_path(),
		"score_data": score_handler.save(),
		"lives_data": lives_handler.save()
	}
	return s

func restore(s: GameSave):
	var data := s.data
	level_manager = load(data["level_manager_script"]).new()
	level_manager.restore(data["level_manager_data"])
	score_handler.restore(data["score_data"])
	lives_handler.restore(data["lives_data"])
	set_map(data["map"].instance())

func on_player_touched_ball(_ball):
	self.lives -= 1
	if self.lives == 0:
		lose()
	else:
		emit_signal("died")
		# Reload the current map
		load_current_map()

func win():
	emit_signal("won")
	next_level()
	
func lose():
	game_over()

func next_level():
	var next_level := level_manager.next_level()
	if next_level:
		set_level(next_level)
	else:
		game_over()

func load_current_map():
	set_map(level_manager.load_map())
	
func game_over():
	is_game_over = true
	var game_over_node: GameOver = game_over_scn.instance()
	game_over_node.score = score_handler.get_leaderboard_score()
	SceneLoader.replace_current_scene_with_node(game_over_node)
	
func set_map(map: Map):
	ui.glitch()
	ui.set_map(map)
	assert(map.connect("won", self, "win") == OK)
	self.current_map = map
	emit_signal("map_changed",map)


func set_level(level: Level):
	emit_signal("level_changed",level)
	load_current_map()

func on_die():
	load_current_map()

func _exit_tree():
	if !is_game_over:
		var saved := save()
		GameSaveManager.add_game(saved)
