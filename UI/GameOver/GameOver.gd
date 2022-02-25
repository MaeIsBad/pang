class_name GameOver
extends Node2D

var score = 0 setget set_score

func _ready():
	set_score(score)

func set_score(score_: int):
	score = score_
	$Label.text = $Label.text.replace("$SCORE", score)
