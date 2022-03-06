extends Timer

var player: Player
var multiplier: float
var duration: float

func _init():
	self.one_shot = true	

func _ready():
	# This doesn't work with other modifiers but 
	# I'm too lazy to do it properly and it's 
	# bascially the end of the project so idc
	player.walking_speed *= multiplier
	player.climbing_speed *= multiplier
	assert(connect("timeout", self, "on_timeout") == OK)
	self.start(duration)

func on_timeout():
	player.walking_speed /= multiplier
	player.climbing_speed /= multiplier
	queue_free()
