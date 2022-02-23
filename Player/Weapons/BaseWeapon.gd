extends Node2D
class_name BaseWeapon

signal emit_bullet(bullet)

export(PackedScene) var bullet_scn: PackedScene = null

# The amount of time after shooting in 
# seconds before you can shoot again
export(float) var firing_rate := 1.0

# The countdown until the next shot can be fired
var next_shot := 0.0

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
		
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		get_tree().set_input_as_handled()
		try_shoot()
