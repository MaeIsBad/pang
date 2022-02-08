extends Camera2D

# Animate the camera centering on a given position
func center_on(pos: Vector2):
	# The camera position is in the top left of the viewport, so we offset it 
	var center_offset = get_viewport_rect().size/(Vector2(2.0,2.0))
	
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
