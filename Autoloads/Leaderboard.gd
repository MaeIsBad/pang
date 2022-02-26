extends Node
class_name LeaderboardManager

# The score on the leaderboard
class Score:
	# The name of the player that achieved the score
	var name: String
	# The score
	var points: int
	# Which module does the score apply
	var module: int


var scores := []

func add_score(score: Score):
	scores.push_back(score)
	print(scores)
