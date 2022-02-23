extends Node2D
class_name BaseWeapon

export(PackedScene) var bullet_scn: PackedScene = null

# The amount of time after shooting in 
# seconds before you can shoot again
export(float) var firing_rate := 1.0

# The countdown until the next shot can be fired
var next_shot := 0.0

func shoot():
	var bullet = bullet_scn.instance()
	bullet.global_position = global_position
	get_parent().get_parent().add_child(bullet)
	next_shot = firing_rate

func try_shoot():
	if next_shot <= 0.0:
		shoot()

func _process(delta):
	if next_shot > 0:
		next_shot = max(0.0, next_shot-delta)
	if Input.is_action_just_pressed("ui_accept"):
		try_shoot()

