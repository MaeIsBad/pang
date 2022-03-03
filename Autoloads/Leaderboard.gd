extends Node
class_name LeaderboardManager

signal score_changed(module)

# The score on the leaderboard
class Score:
	# The name of the player that achieved the score
	var player_name: String
	# The score
	var points: int
	# Which module does the score apply
	var module: int
	
	func save():
		return {
			"player_name": player_name,
			"points": points,
			"module": module
		}

	func restore(data: Dictionary):
		player_name = data["player_name"]
		points = data["points"]
		module = data["module"]


var scores := {1: [], 2:[], 3:[]}

func save():
	var saved := {}
	for module in scores:
		saved[module] = []
		for score in scores[module]:
			saved[module].push_back(score.save())
	return saved

func restore(data):
	for module in data:
		scores[module] = []
		for score_ser in data[module]:
			var score := Score.new()
			score.restore(score_ser)
			scores[module].push_back(score)
	emit_signal("score_changed")
	
const LEADERBOARD_FILE := "user://leaderboard.save"
func save_to_file(_module):
	var f := File.new()
	f.open(LEADERBOARD_FILE, f.WRITE)
	f.store_var(save())
	f.flush()
	f.close()

func load_from_file():
	var f := File.new()
	f.open(LEADERBOARD_FILE, f.READ)
	restore(f.get_var())
	f.close()
	
func _ready():
	if File.new().file_exists(LEADERBOARD_FILE):
		load_from_file()

	Console.add_command("add_score", self,"command_add_score")\
	.add_argument("name", TYPE_STRING)\
	.add_argument("points", TYPE_INT)\
	.add_argument("module", TYPE_INT)\
	.register()
	
	connect("score_changed",self,"save_to_file")

func command_add_score(name: String, points: int, module: int):
	var score := Score.new()
	score.player_name = name
	score.points = points
	score.module = module
	add_score(score)

func add_score(score: Score):
	scores[score.module].push_back(score)
	# Should use insert sort but I'm lazy 
	# and this is fast enough that we don't have to worry about 
	scores[score.module].sort_custom(self, "sort_scores")
	emit_signal("score_changed", score.module)

func sort_scores(a: Score,b: Score):
	return a.points > b.points
