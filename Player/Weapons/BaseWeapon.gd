extends Node2D
class_name BaseWeapon

signal emit_bullet(bullet)
signal time_to_next_shot_changed(cur_time, max_time)

export(PackedScene) var bullet_scn: PackedScene = null

# The amount of time after shooting in 
# seconds before you can shoot again
export(float) var firing_rate := 1.0

# The countdown until the next shot can be fired
export(float) var next_shot := 0.0

export(Texture) var weapon_sprite

var sprite
func _init():
	var child := Sprite.new()
	add_child(child)
	sprite = child

func _ready():
	sprite.texture = weapon_sprite	

func spawn_bullet():
	var bullet = bullet_scn.instance()
	bullet.global_position = global_position
	emit_signal("emit_bullet",bullet)

func shoot():
	next_shot = firing_rate
	self.spawn_bullet()

func try_shoot():
	if next_shot <= 0.0:
		shoot()

func _process(delta):
	if next_shot > 0:
		next_shot = max(0.0, next_shot-delta)
		emit_signal("time_to_next_shot_changed", next_shot, firing_rate)
