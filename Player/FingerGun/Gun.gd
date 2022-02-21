extends Node2D

var bullet_scn = load("res://Player/FingerGun/Bullet.tscn")

func shoot():
	var bullet = bullet_scn.instance()
	# Set the bullet position to the player postition
	bullet.position = $BulletSpawner.global_position
	# Add a bullet to the parent of the player
	get_parent().get_parent().add_child(bullet)

func body_entered(body: Node2D):
	if body.has_method("touched_bullet"):
		body.touched_bullet(self)

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		self.rotation_degrees = -90	
		shoot()
	if Input.is_action_just_released("ui_accept"):
		self.rotation_degrees = 0	
