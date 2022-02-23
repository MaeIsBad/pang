extends Node2D

var bullet_scn = load("res://Player/RPG/RPGBullet.tscn")

func shoot():
	var bullet = bullet_scn.instance()
	# Set the bullet position to the player postition
	bullet.global_position = $BulletSpawner.global_position
	# Add a bullet to the parent of the player
	get_parent().get_parent().add_child(bullet)

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
