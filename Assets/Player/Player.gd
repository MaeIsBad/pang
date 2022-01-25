extends KinematicBody

func _ready():
	pass 

func _process(delta):
	var move_vec = Vector3()
	
	if Input.is_action_pressed("move_left"):
		move_vec.x  -= 300 * delta
	if Input.is_action_pressed("move_right"):
		move_vec.x  += 300 * delta

	move_and_slide(move_vec, Vector3(0, 1, 0))
