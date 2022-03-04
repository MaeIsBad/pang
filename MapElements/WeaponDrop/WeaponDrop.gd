extends Node

var weapon: BaseWeapon = preload("res://Player/Weapons/Laser/LaserGun.gd").new()

onready var weapon_sprite := $WeaponSprite

func _ready():
	weapon_sprite.texture = weapon.weapon_sprite


func body_entered(body):
	var player := body as Player
	if player:
		player.weapon.change_weapon(self.weapon)
		queue_free()
