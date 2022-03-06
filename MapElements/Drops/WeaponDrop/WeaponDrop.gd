extends "res://MapElements/Drops/Drop.gd"

const all_weapons := [
#	preload("res://Player/Weapons/Gun/Gun.gd"),
	preload("res://Player/Weapons/Laser/LaserGun.gd"),
	preload("res://Player/Weapons/Shotgun/Shotgun.gd"),
	preload("res://Player/Weapons/RPG/RPG.gd")
]

export var weapon_idx: int = randi()%len(all_weapons)

var weapon: BaseWeapon 

func _ready():
	weapon = all_weapons[weapon_idx].new()
	self.texture = weapon.weapon_sprite
	assert(connect("player_picked_up", self, "on_player_picked_up") == OK)
	._ready()
	
func on_player_picked_up(player: Player):
	player.weapon.change_weapon(self.weapon)
