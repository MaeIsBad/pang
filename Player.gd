extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("ui_right"):
		move_and_slide(Vector2(100.0,0.0)) 
	if Input.is_action_pressed("ui_left"):
		move_and_slide(Vector2(-100.0,0.0)) 
		
