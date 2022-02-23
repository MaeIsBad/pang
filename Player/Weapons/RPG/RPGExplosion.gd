extends Node2D

var radius := 50.0

func _init(radius_: float):
	radius = radius_

func _ready():
	assert(get_tree().create_timer(0.1).connect("timeout",self,"queue_free") == OK)

func _draw():
	draw_circle(Vector2.ZERO,radius,Color.yellow)
