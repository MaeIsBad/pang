tool
extends RigidBody2D
class_name Ball

export(int) var size = 4
export(int) var base_size = 10

var ball_scn = load("res://Ball/Ball.tscn")

func get_radius():
	return size*base_size
	
func _ready():
	var shape = CircleShape2D.new()
	shape.radius = get_radius()
	$CollisionShape2D.shape = shape

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
	var parent = get_parent()
	if size > 1:
		parent.call_deferred("add_child", spawn_child_ball())
		parent.call_deferred("add_child", spawn_child_ball(true))
	
	
	var pop: AudioStreamPlayer2D = $PopSound
	remove_child(pop)
	pop.position = position
	parent.call_deferred("add_child", pop)
	pop.play()
	queue_free()

func _draw():
	draw_circle(Vector2(0.0,0.0), get_radius(), Color.black)

func touched_body(body: Node2D):
	if body.has_method("touched_ball"):
		body.touched_ball(self)
