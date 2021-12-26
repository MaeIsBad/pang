tool
extends Node2D
class_name Bullet

export(int,0,100) var UNITS_PER_SECOND = 800.0

func body_entered(body: Node2D):
	var ball = body as Ball
	if ball != null:
		ball.pop()
		queue_free()

func _process(delta):
	if not Engine.editor_hint:
		position -= Vector2(0.0, UNITS_PER_SECOND)*delta

func _draw():
	draw_circle(Vector2(0.0,0.0), 7.0, Color.blue)
