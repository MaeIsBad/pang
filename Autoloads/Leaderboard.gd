extends Node
class_name LeaderboardManager

signal score_changed(module)

# The score on the leaderboard
class Score:
	# The name of the player that achieved the score
	var name: String
	# The score
	var points: int
	# Which module does the score apply
	var module: int


var scores := {1: [], 2:[], 3:[]}

func _ready():
	Console.add_command("add_score", self,"command_add_score")\
	.add_argument("name", TYPE_STRING)\
	.add_argument("points", TYPE_INT)\
	.add_argument("module", TYPE_INT)\
	.register()

func command_add_score(name: String, points: int, module: int):
	var score := Score.new()
	score.name = name
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
