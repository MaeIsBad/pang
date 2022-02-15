extends Node2D
class_name Map

signal player_lives_changed(lives)
signal lost(lives)

export var lives: int = 4 setget set_lives

func set_lives(new: int) -> int:
	lives = new
	emit_signal("player_lives_changed", new)
	return lives


func on_Player_touched_ball(_ball: Ball):
	self.lives -= 1
	if lives <= 1:
		emit_signal("lost")
