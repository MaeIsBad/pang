extends Node2D

export(Texture) var texture: Texture

# The amount of units at which the laser grows per second 
export var laser_speed := 250.0

# The amount of time(in seconds) laser stays stationary before it starts to disappear
export var laser_stationary_duration := 0.5
export var width := 2.0

enum LaserState {
	Grow,
	Stationary,
	Shrink
}

var state = LaserState.Grow

func _ready():
	$Area2D/CollisionShape2D.shape = RectangleShape2D.new()
func _process(delta):
	match state:
		LaserState.Grow:
			var grow_top = to_local($RayCast2D.get_collision_point()).y
			self.laser_top -= laser_speed*delta
			if self.laser_top <= grow_top:
				self.laser_top = grow_top
				state = LaserState.Stationary
				yield(get_tree().create_timer(laser_stationary_duration),"timeout")
				self.state =LaserState.Shrink
		LaserState.Shrink:
			self.laser_bottom -= laser_speed*delta
			if self.laser_top >= self.laser_bottom:
				self.queue_free()


var laser_bottom := 0.0 setget set_laser_bottom
var laser_top := 0.0 setget set_laser_top

func get_laser_rect()-> Rect2:
	return Rect2(0.0,laser_top, width,laser_top-laser_bottom)

func set_laser_bottom(bottom: float):
	laser_bottom = bottom
	update_laser_size()	
	
func set_laser_top(top: float):
	laser_top = top
	update_laser_size()	

func update_laser_size():
	var r := get_laser_rect()
	var col_shape := $Area2D/CollisionShape2D.shape as RectangleShape2D
	col_shape.extents = r.size/2
	$Area2D.position.y = laser_bottom+(laser_top-laser_bottom)/2
	update()

func _draw():
	draw_texture_rect(texture,get_laser_rect(),true)

func body_entered(body: Node2D):
	if body.has_method("touched_bullet"):
		body.touched_bullet(self)
