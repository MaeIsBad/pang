extends Control
onready var module_to_col = {
		1: $HBoxContainer/Module1Scores,
		2: $HBoxContainer/Module2Scores,
		3: $HBoxContainer/Module3Scores
}
func _ready():
	assert(Leaderboard.connect("score_changed", self, "score_changed") == OK)
	update_all_cols()
	
func update_all_cols():
	for i in range(3):
		update_col(i+1)

func update_col(module: int):
	module_to_col[module].set_scores(Leaderboard.scores[module])	

func score_changed(module: int):
	update_col(module)
