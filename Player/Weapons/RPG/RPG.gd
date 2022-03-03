extends BaseWeapon

func _init():
	weapon_sprite = preload("res://Assets/Player/Weapons/weapon_3.png")
	
func _ready():
	bullet_scn = preload("res://Player/Weapons/RPG/RPGBullet.tscn")
	firing_rate = 1.5
