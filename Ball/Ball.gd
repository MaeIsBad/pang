tool
extends RigidBody2D
class_name Ball

# The amount of times this ball will "pop" into smaller balls
export(int) var size = 4
# The size of the smallest instance of the ball
export(int) var base_size = 10
# The amount of bonuce height to remove per size
export(float) var bounce_damp = 200.0
# The minimal height the ball should bounce to
export(float) var smallest_bounce_height = 100.0
# Minimal x velocity
export(float) var min_horizontal_velocity = 200.0

var ball_scn = load("res://Ball/Ball.tscn")

var invincible := true

func get_radius():
	return size*base_size

func _ready():
	var shape = CircleShape2D.new()
	shape.radius = get_radius()
	$CollisionShape2D.shape = shape
	yield(get_tree().create_timer(0.1),"timeout")
	invincible = false

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

# Destroy the ball, play the "pop" sound and spawn 2 child balls
func pop():
	if self.invincible:
		return
	# Don't destroy the ball more than once
	if self.is_queued_for_deletion():
		return

	var parent = get_parent()
	if size > 1:
		parent.call_deferred("add_child", spawn_child_ball())
		parent.call_deferred("add_child", spawn_child_ball(true))
	
	
	var pop: AudioStreamPlayer2D = $PopSound
	remove_child(pop)
	pop.position = position
	parent.call_deferred("add_child", pop)
	pop.play()
	
	if parent.has_method("ball_popped"):
		parent.ball_popped(self)
	queue_free()

# React to touching a bullet
func touched_bullet(_bullet):
	pop()

func _draw():
	draw_circle(Vector2(0.0,0.0), get_radius(), Color.gray)

func body_entered(body: Node2D):
	if body.has_method("touched_ball"):
		body.touched_ball(self)

# To ensure that the ball bounces lower with time, and that the ball always bounces a bit higher than the player height
# after the body has finished colliding we need to update the vertical velocity 
func _integrate_forces(state: Physics2DDirectBodyState):
	for i in range(state.get_contact_count()):
		var colider_normal = state.get_contact_local_normal(i)
		#Check if the collison occured under the ball
		if colider_normal.y == -1:
			var y_vel = smallest_bounce_height + size * bounce_damp
			state.linear_velocity.y = -y_vel

	if abs(state.linear_velocity.x) < min_horizontal_velocity:
		var direction = 1 if state.linear_velocity.x > 0 else -1
		state.linear_velocity.x = min_horizontal_velocity*direction
