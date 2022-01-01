extends Node2D

var lose_scn = preload("res://UI/Lose.tscn")

func on_Player_touched_ball(Ball):
	var lose: Control = lose_scn.instance()
	lose.rect_size = get_viewport_rect().size
	add_child(lose)
