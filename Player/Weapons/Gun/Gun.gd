extends BaseWeapon

func _init():
	weapon_sprite = preload("res://Assets/Player/Weapons/weapon_1.png")
	bullet_scn = preload("res://Player/Weapons/Gun/Bullet.tscn")
	firing_rate = 0.3
