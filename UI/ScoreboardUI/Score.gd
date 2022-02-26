extends Label

var score: Leaderboard.Score

func _ready():
	self.text = "%s: %s" % [score.name, score.points]
