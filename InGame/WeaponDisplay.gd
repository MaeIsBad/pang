extends Node

onready var in_game := get_parent()
onready var ui := $"../UI"
func _ready():
	assert(in_game.connect("map_changed", self, "on_map_changed") == OK)
	
func on_map_changed(map: Map):
	map.connect("player_ready", self, "on_player_ready")
	
func on_player_ready(player: Player):
	player.weapon.connect("weapon_changed", self, "on_weapon_changed")
	if player.weapon.current_weapon:
		on_weapon_changed(player.weapon.current_weapon)
func on_weapon_changed(weapon: BaseWeapon):
	weapon.connect("time_to_next_shot_changed", self, "on_time_to_next_shot_changed")
	on_time_to_next_shot_changed(weapon.next_shot, weapon.firing_rate)
	ui.set_weapon_texture(weapon.weapon_sprite)

func on_time_to_next_shot_changed(left: float, max_time: float):
	ui.set_weapon_charge((1-(left/max_time))*100.0)
