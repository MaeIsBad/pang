extends KinematicBody2D
class_name Player

signal touched_ball(Ball)
enum State {Walking, Climbing}

var state = State.Walking
var snapped_to_ground = false

# The ladder the player is standing on
var ladder: Ladder = null

const UP = Vector2(0.0, -1.0)
const GRAVITY = 400.0

# Returns true if found a ground to snap to
func snap_to_ground() -> bool:
	var col = get_world_2d().direct_space_state.intersect_ray(position,Vector2(0.0,10.0),[self])
	if col != {}:
		# warning-ignore:return_value_discarded
		move_and_collide(Vector2(0.0,2000.0))
		return true
	else:
		return false

var bullet_scn = load("res://Player/Bullet.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var bullet = bullet_scn.instance()
		bullet.position = position
		get_parent().add_child(bullet)

	if(state == State.Walking):
		walking_process(delta)
	if(state == State.Climbing):
		climbing_process(delta)
	# Wait until you manage to find a ground to teleport to
	if not snapped_to_ground:
		snapped_to_ground = snap_to_ground()



func switch_to_climbing():
	assert(ladder != null)
	self.position.x = ladder.position.x
	collision_mask = 1<<3
	state = State.Climbing
	
func switch_to_walking():
	collision_mask = 1<<0
	state = State.Walking
	
func climbing_process(delta):
	var colliding_with_top = $Feet.get_collision_normal() == Vector2(0.0,-1.0)
	var can_start_walking = $Feet.is_colliding() && colliding_with_top
	
	if Input.is_action_pressed("ui_up"):
		move_and_slide(Vector2(0.0,-200.0), UP) 
	if Input.is_action_pressed("ui_down"):
		move_and_slide(Vector2(0.0,200.0), UP)
	if can_start_walking && (Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right")):
		switch_to_walking()
	
func walking_process(_delta):
	if Input.is_action_pressed("ui_right"):
	# warning-ignore:return_value_discarded
		move_and_slide(Vector2(300.0,0.0), UP) 
	if Input.is_action_pressed("ui_left"):
	# warning-ignore:return_value_discarded
		move_and_slide(Vector2(-300.0,0.0), UP)
		
	move_and_slide(Vector2(0.0,GRAVITY), UP)
	
	var can_switch_to_climbing = self.ladder && abs(self.ladder.position.x - self.position.x) < 10
	if (Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down")) && can_switch_to_climbing:
		self.switch_to_climbing()

func touched_ball(ball: Ball):
	emit_signal("touched_ball", ball)

func ladder_entered(l_entered: Ladder):
	self.ladder = l_entered

func ladder_exited(_ladder: Ladder):
	self.ladder = null
