extends Camera2D

# The camera position is in the top left of the viewport, so we offset it 
func get_center_offset():
	return get_viewport_rect().size/(Vector2(2.0,2.0))

func center_on(pos: Vector2):
	position = get_center_offset()+pos
	

const anim_time: float = 1.0
# Animate the camera centering on a given position
func animated_center_on(pos: Vector2):
	var center_offset = get_center_offset()
	
	var tween = $Tween
	tween.interpolate_property(self,
		"zoom", 
		zoom, 
		Vector2(1.2,1.2),
		anim_time,
		Tween.TRANS_CUBIC,
		Tween.EASE_IN_OUT)

	tween.start()
	yield(get_tree().create_timer(anim_time/2.0), "timeout")

	tween.interpolate_property(self,
		"position", 
		position, 
		center_offset+pos,
		anim_time,
		Tween.TRANS_CUBIC,
		Tween.EASE_IN_OUT)

	yield(tween,"tween_completed")

	tween.interpolate_property(self,
		"zoom", 
		zoom,
		Vector2(1.0,1.0),
		anim_time,
		Tween.TRANS_CUBIC,
		Tween.EASE_IN_OUT)
	tween.start()
