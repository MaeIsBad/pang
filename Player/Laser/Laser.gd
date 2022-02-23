extends Node2D

# The amount of units at which the laser grows per second 
export var laser_speed := 100.0

# The amount of time(in seconds) laser stays stationary before it starts to disappear
export var laser_stationary_duration := 1.0
	

func _physics_process(delta):
	# Raycast should always have a ceiling to collide with. 
	# If it doesn't something is horribly wrong, let's just panic
	assert($RayCast2D.is_colliding())
	var new_height = get_height()+laser_speed*delta
	var col_height = to_local($RayCast2D.get_collision_point()).y
	print(col_height," ",new_height, " ")
	if new_height*2 < abs(col_height):
		grow_laser_upwards(new_height)
func body_entered(body: Node2D):
	if body.has_method("touched_bullet"):
		body.touched_bullet(self)
		queue_free()

func get_height() -> float:
	return $GrowContainer.scale.y

func get_top() -> float:
	return $GrowContainer.scale.y+position.y

# Increase the height to a given height(in units) while keeping the bottom part in place
func grow_laser_upwards(height: float):
	$GrowContainer.scale.y = height
	$GrowContainer.position.y = -height
	
# Shrink the height of the laser to height(in units) while keeping the top part in place
func shrink_laser_upwards(height: float):
	var old_height = $GrowContainer.scale.y
	var old_y = $GrowContainer.position.y
	
	$GrowContainer.scale.y = height
	$GrowContainer.position.y = old_y-old_height+height
