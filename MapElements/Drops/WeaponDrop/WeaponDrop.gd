# Abstract class
extends "res://MapElements/Drops/Drop.gd"

var weapon: BaseWeapon

func _ready():
	self.texture = weapon.weapon_sprite
	assert(connect("player_picked_up", self, "on_player_picked_up") == OK)

func on_player_picked_up(player: Player):
	player.weapon.change_weapon(self.weapon)
