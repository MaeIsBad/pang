extends Node2D


# The amount of time after shooting in 
# seconds before you can shoot again
export(float) var shooting_rate = 1.0

# The countdown until you can fire the next shot
var next_shot: float = 0.0

var laser_scn = preload("res://Player/Laser/Laser.tscn")

func shoot():
	var laser = laser_scn.instance()
	laser.global_position = $BulletSpawner.global_position
	get_parent().get_parent().add_child(laser)
	next_shot = shooting_rate

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") && next_shot <= 0.0:
		shoot()
	if next_shot > 0:
		next_shot = max(0.0, next_shot-delta)
