extends Label

var score: Leaderboard.Score

func _ready():
	self.text = "%s: %s" % [score.player_name, score.points]
