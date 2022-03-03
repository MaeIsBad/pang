extends Node2D
class_name RPGBullet
var explosion_script = preload("res://Player/Weapons/RPG/RPGExplosion.gd")

export(float,0,1000) var UNITS_PER_SECOND = 800.0
export var explosion_radius := 50.0

const MAX_EXPLOSTION_TIME = 0.2

func explode():
	# Simulate explosion spreading to achieve a more satisfying
	#; "pop" sound effect when the balls get destroyed
	for body in $ExplosionArea.get_overlapping_bodies():
		if body.has_method("touched_bullet"):
			var distance := global_position.distance_to(body.global_position)
			if distance/200.0 < MAX_EXPLOSTION_TIME:
				assert(get_tree().create_timer(distance/200.0).connect("timeout",body, "touched_bullet",[self]) == OK)
			else:
				body.touched_bullet(self)
	var explosion = explosion_script.new(explosion_radius)
	explosion.global_position = global_position
	get_parent().add_child(explosion)
	queue_free()
func _process(delta):
	position -= Vector2(0.0, UNITS_PER_SECOND)*delta

func _draw():
	draw_circle(Vector2(0.0,0.0), 7.0, Color.red)

func hitbox_entered(_body):
	explode()
