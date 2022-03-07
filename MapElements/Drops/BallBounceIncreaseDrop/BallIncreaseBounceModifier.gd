extends Timer

onready var ball: Ball = get_parent()
var bounce_multiplier: float

func _init(ball: Ball, bounce_multiplier_: float, duration: float):
	self.bounce_multiplier = bounce_multiplier_
	self.one_shot = true
	self.connect("timeout", self, "on_timeout")
	self.start(duration)
	self.autostart = true 
	
	ball.set_deferred("bounce", ball.smallest_bounce_height * bounce_multiplier)	
	ball.call_deferred("add_child", self)


func on_timeout():
	ball.set_deferred("bounce", ball.smallest_bounce_height / bounce_multiplier)
	queue_free()
