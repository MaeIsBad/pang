class_name GameOver
extends CenterContainer

onready var score: LeaderboardManager.Score
onready var score_display := $HBoxContainer/MarginContainer/ScoreDisplayLabel
onready var submit_button := $HBoxContainer/HBoxContainer/SubmitButton

func _ready():
	if(score):
		set_score(score)

func set_score(score_: LeaderboardManager.Score):
	score = score_
	score_display.text = score_display.text.replace("$SCORE", score.points)
	
func nick_text_changed(new_text: String):
	score.player_name = new_text
	submit_button.disabled = len(new_text) == 0

func submit_button_pressed():
	Leaderboard.add_score(score)
	back_to_main_menu()

func back_to_main_menu():
	SceneLoader.switch_to_main_menu()
