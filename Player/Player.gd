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

func _ready():
	switch_to_walking()

func _process(delta):
	if(state == State.Walking):
		walking_process(delta)
	if(state == State.Climbing):
		climbing_process(delta)
	# Wait until you manage to find a ground to teleport to
	if not snapped_to_ground:
		snapped_to_ground = snap_to_ground()

enum Rotation {
	Left,
	Right
}
var curr_rotation = Rotation.Right

func switch_to_climbing():
	$AnimatedSprite.animation = "climbing"	
	assert(ladder != null)
	self.position.x = ladder.position.x
	collision_mask = 1<<3
	state = State.Climbing
	
func switch_to_walking():
	collision_mask = 1<<0
	state = State.Walking
	$AnimatedSprite.playing = true
	
func climbing_process(_delta):
	var colliding_with_top = $Feet.get_collision_normal() == Vector2(0.0,-1.0)
	var can_start_walking = $Feet.is_colliding() && colliding_with_top
	
	var direction := 0
	if Input.is_action_pressed("ui_up"):
		direction = -1
	if Input.is_action_pressed("ui_down"):
		direction = 1
	# warning-ignore:return_value_discarded
	move_and_slide(Vector2(0.0,direction*200.0), UP) 
	$AnimatedSprite.playing = direction != 0.0
	if can_start_walking && (Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right")):
		switch_to_walking()
	
func walking_process(_delta):
	var direction := 0
	if Input.is_action_pressed("ui_right"):
		if curr_rotation != Rotation.Right:
			scale.x *= -1.0
			curr_rotation = Rotation.Right
		direction = 1
	if Input.is_action_pressed("ui_left"):
		if curr_rotation != Rotation.Left:
			scale.x *= -1.0
			curr_rotation = Rotation.Left
		direction = -1

	# warning-ignore:return_value_discarded
	move_and_slide(Vector2(direction*300.0,0.0), UP)
	if direction == 0.0:
		$AnimatedSprite.animation = "static"
	else:
		$AnimatedSprite.animation = "running"
	# warning-ignore:return_value_discarded
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


# Wojsko kwarciane
