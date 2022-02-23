extends BaseWeapon

func _ready():
	bullet_scn = preload("res://Player/Weapons/Gun/Bullet.tscn")
	firing_rate = 0.8

	
func spawn_bullet():
	for i in range(3):
		var bullet: Node2D = bullet_scn.instance()
		bullet.global_position = global_position
		bullet.rotation_degrees = (i-1)*15
		get_parent().get_parent().add_child(bullet)
