class_name Ladder
extends Area2D
tool

export var height: float = 50.0 setget set_height
func set_height(val: float):
	if($CollisionShape2D == null):
		yield(self,"ready")	
	var col_shape: RectangleShape2D = ($CollisionShape2D.shape as RectangleShape2D)
	height = val
	$Sprite.region_rect.size.y = height
	col_shape.extents = Vector2(col_shape.extents.x, height/2.0)
	if not Engine.editor_hint:
		$LadderTop.position.y = (height/2.0)
		$LadderBot.position.y = -(height/2.0)

func body_entered(body):
	if body.has_method("ladder_entered"):
		body.ladder_entered(self)

func body_exited(body):
	if body.has_method("ladder_exited"):
		body.ladder_exited(self)
