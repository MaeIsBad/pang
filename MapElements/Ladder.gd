class_name Ladder
extends Area2D

var bottom: float setget set_bottom
var top: float setget set_top
func set_bottom(btm: float):
	bottom = btm
	update_ladder()

func set_top(top_: float):
	top = top_
	update_ladder()

func update_ladder():
	if(!$LadderBot):
		return
	$LadderBot.position.y = bottom
	$LadderTop.position.y = top
	
	var shape := ($CollisionShape2D.shape as RectangleShape2D)
	var height = abs(bottom-top)
	$CollisionShape2D.position.y = (bottom+top)/2.0
	shape.extents.y = height/2.0
func _ready():
	$CollisionShape2D.shape = $CollisionShape2D.shape.duplicate()
	update_ladder()
	

func body_entered(body):
	if body.has_method("ladder_entered"):
		body.ladder_entered(self)

func body_exited(body):
	if body.has_method("ladder_exited"):
		body.ladder_exited(self)
