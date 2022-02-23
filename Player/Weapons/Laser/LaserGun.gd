extends BaseWeapon

func _ready():
	firing_rate = 1.0
	bullet_scn = preload("res://Player/Weapons/Laser/Laser.tscn")
