extends Node2D
class_name GunBullet

export(float,0,1000) var UNITS_PER_SECOND = 800.0

func body_entered(body: Node2D):
	if body.has_method("touched_bullet"):
		body.touched_bullet(self)
	queue_free()

func _process(delta):
	position += (Vector2(0.0, -UNITS_PER_SECOND).rotated(rotation))*delta
