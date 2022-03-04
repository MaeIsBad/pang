extends ReferenceRect

const weapon_drop_scn := preload("res://MapElements/WeaponDrop/WeaponDrop.tscn")

var timer := Timer.new()

const all_weapons := [
#	preload("res://Player/Weapons/Gun/Gun.gd"),
	preload("res://Player/Weapons/Laser/LaserGun.gd"),
	preload("res://Player/Weapons/Shotgun/Shotgun.gd"),
	preload("res://Player/Weapons/RPG/RPG.gd")
]

# Time to spawn the next power-up
func randomize_time_to_spawn():
	var time := rand_range(5.0,15.0)
	timer.start(time)

func _init():
	add_child(timer)
	assert(timer.connect("timeout", self,"on_timer_timeout") == OK)
	assert(timer.connect("timeout", self,"randomize_time_to_spawn") == OK)

func _ready():
	randomize_time_to_spawn()
	
func on_timer_timeout():
	#var x := rand_range(self.get_rect().position.x, self.get_rect().end.x)
	var weapon = all_weapons[randi()%len(all_weapons)].new()
	var drop := weapon_drop_scn.instance()
	drop.weapon = weapon
	var xpos := rand_range(self.get_rect().position.x, self.get_rect().end.x)
	drop.position = self.get_rect().position
	drop.position.x = xpos
	get_parent().call_deferred("add_child", drop)
