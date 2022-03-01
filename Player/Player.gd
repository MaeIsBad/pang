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

enum CollisionMask {
	CLIMBING = 1 << 3,
	WALKING  = 1 << 0
}

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
	$AnimationPlayer.stop(false)

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
	$AnimationPlayer.current_animation = "Climbing"
	assert(ladder != null)
	self.global_position.x = ladder.global_position.x
	collision_mask = CollisionMask.CLIMBING
	state = State.Climbing
	
func switch_to_walking():
	collision_mask = CollisionMask.WALKING
	state = State.Walking
	
func climbing_process(_delta):
	var colliding_with_top = $Feet.get_collision_normal() == Vector2(0.0,-1.0) && $Feet.is_colliding()
	collision_mask = CollisionMask.WALKING
	var in_block := test_move(transform, Vector2(1.0,-1.0))
	collision_mask = CollisionMask.CLIMBING
	
	var can_start_walking = !in_block && colliding_with_top

	var direction := 0
	if Input.is_action_pressed("ui_up"):
		direction = -1
	if Input.is_action_pressed("ui_down"):
		direction = 1
	# warning-ignore:return_value_discarded
	move_and_slide(Vector2(0.0,direction*200.0), UP)
	if direction == 0: 
		$AnimationPlayer.stop(false)
	else:
		$AnimationPlayer.play("Climbing")
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
		$AnimationPlayer.current_animation = "Static"
	else:
		$AnimationPlayer.current_animation = "Running"
	# warning-ignore:return_value_discarded
	move_and_slide(Vector2(0.0,GRAVITY), UP)
	
	var can_switch_to_climbing = self.ladder && abs(self.ladder.global_position.x - self.global_position.x) < 10
	if (Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down")) && can_switch_to_climbing:
		self.switch_to_climbing()

func touched_ball(ball: Ball):
	emit_signal("touched_ball", ball)

func ladder_entered(l_entered: Ladder):
	self.ladder = l_entered

func ladder_exited(_ladder: Ladder):
	self.ladder = null

const props_to_save = [
	"scale",
	"curr_rotation",
	"rotation",
	"position",
	"state",
	"snapped_to_ground"
]

func save_node():
	var props = {}
	for prop in props_to_save:
		props[prop] = get(prop)

	var ladder_path = ""
	if self.ladder:
		ladder_path = get_path_to(ladder)
	props["ladder_path"] = ladder_path
	return props

func load_node(props: Dictionary):
	for prop in props_to_save:
		set(prop, props[prop])
	if props["ladder_path"]:
		yield(self,"tree_entered")
		ladder = get_node(props["ladder_path"])
