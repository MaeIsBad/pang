extends ReferenceRect

const weapon_drop_scn := preload("res://MapElements/Drops/WeaponDrop/WeaponDrop.tscn")
const life_drop_scn := preload("res://MapElements/Drops/LifeDrop/LifeDrop.tscn")
const time_stop_drop_scn := preload("res://MapElements/Drops/TimeStopDrop/TimeStopDrop.tscn")
const speed_boost_drop_scn := preload("res://MapElements/Drops/SpeedBoostDrop/SpeedBoostDrop.tscn")


var timer := Timer.new()

export var min_spawn_time := 5.0
export var max_spawn_time := 15.0

# The power ups that should spawn
export(int, FLAGS, "Weapons", "Life") var spawnable_powerups = 1



# Time to spawn the next power-up
func randomize_time_to_spawn():
	var time := rand_range(min_spawn_time,max_spawn_time)
	timer.start(time)

func _init():
	add_child(timer)
	assert(timer.connect("timeout", self,"on_timer_timeout") == OK)
	assert(timer.connect("timeout", self,"randomize_time_to_spawn") == OK)

func _ready():
	randomize_time_to_spawn()
	
func on_timer_timeout():
	var drop := speed_boost_drop_scn.instance()	
	#var drop := weapon_drop_scn.instance()
	var xpos := rand_range(self.get_rect().position.x, self.get_rect().end.x)
	
	drop.position = self.get_rect().position
	drop.position.x = xpos
	get_parent().call_deferred("add_child", drop)
