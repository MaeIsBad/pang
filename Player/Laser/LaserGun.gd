extends Node2D

var laser_scn = preload("res://Player/Laser/Laser.tscn")

func shoot():
	var laser = laser_scn.instance()
	$BulletSpawner.add_child(laser)


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
