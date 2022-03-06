extends Node2D

var radius := 50.0

var timer := Timer.new()
func _init(radius_: float):
	radius = radius_
	add_child(timer)
	assert(timer.connect("timeout",self,"queue_free") == OK)

	
func _ready():
	timer.start(0.1)	

func _draw():
	draw_circle(Vector2.ZERO,radius,Color.yellow)
