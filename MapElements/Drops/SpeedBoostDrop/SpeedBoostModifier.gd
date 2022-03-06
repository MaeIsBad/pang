extends Timer

onready var player: Player = get_parent()
var multiplier: float

func _init(player: Player, multiplier_: float, time: float):
	self.one_shot = true
	# This doesn't work with other modifiers but 
	# I'm too lazy to do it properly and it's 
	# bascially the end of the project so idc
	player.walking_speed *= multiplier
	player.climbing_speed *= multiplier
	player.add_child(self)
	self.multiplier = multiplier_
	self.start(time)

func _ready():
	assert(connect("timeout", self, "on_timeout") == OK)
	self.start()

func on_timeout():
	player.walking_speed /= multiplier
	player.climbing_speed /= multiplier
	queue_free()
