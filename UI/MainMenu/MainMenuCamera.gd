extends Camera2D

# The camera position is in the top left of the viewport, so we offset it 
func get_center_offset():
	return get_viewport_rect().size/(Vector2(2.0,2.0))

func center_on(pos: Vector2):
	position = get_center_offset()+pos
	
# Animate the camera centering on a given position
func animated_center_on(pos: Vector2):
	var center_offset = get_center_offset()
	
	var tween = $Tween
	tween.interpolate_property(self,
		"zoom", 
		zoom, 
		Vector2(1.2,1.2),
		1,
		Tween.TRANS_CUBIC,
		Tween.EASE_IN_OUT)

	tween.start()
	yield(tween,"tween_completed")

	tween.interpolate_property(self,
		"position", 
		position, 
		center_offset+pos,
		1,
		Tween.TRANS_CUBIC,
		Tween.EASE_IN_OUT)

	tween.start()
	yield(tween,"tween_completed")

	tween.interpolate_property(self,
		"zoom", 
		zoom,
		Vector2(1.0,1.0),
		1,
		Tween.TRANS_CUBIC,
		Tween.EASE_IN_OUT)
	tween.start()
