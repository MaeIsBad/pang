extends Node2D

var bullet_scn = load("res://Player/Gun/Bullet.tscn")

func shoot():
	var bullet = bullet_scn.instance()
	# Set the bullet position to the player postition
	bullet.position = get_parent().position
	# Add a bullet to the parent of the player
	get_parent().get_parent().add_child(bullet)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
