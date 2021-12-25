tool
extends RigidBody2D
class_name Ball

export(int) var size = 4
export(int) var base_size = 10

var ball_scn = load("res://Ball.tscn")

func get_collision_shape() -> CircleShape2D:
	var circle = $CollisionShape2D.shape as CircleShape2D
	assert(circle != null)
	return circle

func get_radius():
	return size*base_size
	
func _ready():
	get_collision_shape().radius = get_radius()

func spawn_child_ball(flip_x: bool = false) -> Ball:
	var ball = ball_scn.instance()
	
	ball.size = size-1
	ball.base_size = base_size
	ball.linear_velocity = linear_velocity	
	if flip_x:
		ball.linear_velocity.x = -linear_velocity.x
	
	# Offset ball position by ball radius in the direction of the linear velocity
	var offset = Vector2(ball.get_radius(), 0.0)*ball.linear_velocity.normalized()
	ball.position = position+offset
	return ball

func pop():
	if size > 0:
		var parent = get_parent()
		parent.add_child(spawn_child_ball())
		parent.add_child(spawn_child_ball(true))
	queue_free()

func _process(_delta):
	if not Engine.editor_hint:
		if Input.is_action_just_released("ui_accept"):
			print("POP")
			pop()

func _draw():
	draw_circle(Vector2(0.0,0.0), get_radius(), Color.black)
