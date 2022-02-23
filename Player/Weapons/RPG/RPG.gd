extends BaseWeapon

func _ready():
	bullet_scn = preload("res://Player/Weapons/RPG/RPGBullet.tscn")
	firing_rate = 1.5
