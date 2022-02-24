extends Node

# The score before the current level has started
# This is the value that the score will be reset 
# to after player dies
var score_pre_current_level := 0
var score := 0 setget set_score

func set_score(score_: int):
	score = score_
	$"..".ui.set_score(score)
	
func on_map_changed(map: Map):
	assert(map.connect("ball_popped", self, "ball_popped") == OK)
	
func ball_popped(_ball: Ball):
	self.score += 100

func on_player_won():
	self.score += 1000
	score_pre_current_level = self.score

func on_player_died():
	self.score = score_pre_current_level
