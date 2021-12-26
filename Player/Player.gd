extends KinematicBody2D


var snapped_to_ground = false
# Returns true if found a ground to snap to
func snap_to_ground() -> bool:
	var col = get_world_2d().direct_space_state.intersect_ray(position,Vector2(0.0,10.0),[self])
	if col != {}:
		# warning-ignore:return_value_discarded
		move_and_collide(Vector2(0.0,2000.0))
		return true
	else:
		return false

var bullet_scn = preload("res://Player/Bullet.tscn")

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
	# warning-ignore:return_value_discarded
		move_and_slide(Vector2(300.0,0.0)) 
	if Input.is_action_pressed("ui_left"):
	# warning-ignore:return_value_discarded
		move_and_slide(Vector2(-300.0,0.0))
	if Input.is_action_just_pressed("ui_accept"):
		var bullet = bullet_scn.instance()
		bullet.position = position
		get_parent().add_child(bullet)

	# Wait until you manage to find a ground to teleport to
	if not snapped_to_ground:
		snapped_to_ground = snap_to_ground()
