extends Node2D
class_name Map

signal player_touched_ball
signal won
signal ball_popped(ball)

func _ready():
	Console.remove_command("spawn_ball")
	Console.add_command("spawn_ball", self, "command_spawn_ball")\
	.add_argument("ball_size", TYPE_INT)\
	.register()
	
	Console.remove_command("nuke")
	Console.add_command("nuke", self, "command_nuke")\
	.register()

func command_spawn_ball(size: int):
	var ball = preload("res://Ball/Ball.tscn").instance()
	ball.global_position = get_viewport().get_mouse_position()
	ball.size = size
	add_child(ball)

func command_nuke():
	for ball in get_tree().get_nodes_in_group("Balls"):
		ball.pop()

# Global var used to keep track if we've already won
var won = false
func _process(_delta):
	# Check if any balls still exist, if they don't win.
	# This is not the fastest way to do this,
	# but it's the least error prone and there is no need to optimize it.
	if len(get_tree().get_nodes_in_group("Balls")) == 0 and !won:
		won = true
		Console.write_line("Won the game")
		emit_signal("won")
	pass

func ball_popped(ball: Ball):
	emit_signal("ball_popped", ball)

func on_Player_touched_ball(_ball: Ball):
	emit_signal("player_touched_ball")
