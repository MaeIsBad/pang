tool
extends RigidBody2D
class_name Bullet

func _ready():
	if not Engine.editor_hint:
		assert($Area2D.connect("body_entered",self, "body_entered") == OK)
		assert($VisibilityNotifier2D.connect("screen_exited",self, "queue_free") == OK)

func body_entered(body: Node2D):
	var ball = body as Ball
	if ball != null:
		ball.pop()
		queue_free()

func _draw():
	draw_circle(Vector2(0.0,0.0), 7.0, Color.blue)
