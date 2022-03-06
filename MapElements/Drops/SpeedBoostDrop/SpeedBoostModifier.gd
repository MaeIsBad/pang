extends Timer

var player: Player
var multiplier: float
var duration: float

func _init():
	self.one_shot = true	

func _ready():
	player.walking_speed *= multiplier
	player.climbing_speed *= multiplier
	assert(connect("timeout", self, "on_timeout") == OK)
	self.start(duration)

func on_timeout():
	player.walking_speed /= multiplier
	player.climbing_speed /= multiplier
	queue_free()
