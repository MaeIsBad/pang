extends Node2D
class_name Map

signal player_touched_ball
signal won

# Global var used to keep track if we've already won
var won = false
func _process(_delta):
	# Check if any balls still exist, if they don't win.
	# This is not the fastest way to do this,
	# but it's the least error prone and there is no need to optimize it.
	if len(get_tree().get_nodes_in_group("Balls")) == 0 and !won:
		won = true
		emit_signal("won")
	pass

func on_Player_touched_ball(_ball: Ball):
	emit_signal("player_touched_ball")
