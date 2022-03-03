extends BaseWeapon

func _init():
	weapon_sprite = preload("res://Assets/Player/Weapons/weapon_3.png")
	firing_rate = 1.0
	bullet_scn = preload("res://Player/Weapons/Laser/Laser.tscn")
