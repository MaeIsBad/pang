# Abstarct class
extends RigidBody2D
signal player_picked_up(Player)
 
onready var drop := $DropSprite
export var texture: Texture setget set_drop_texture

func _ready():
	update_drop_texture()

func set_drop_texture(texture_: Texture):
	texture = texture_
	update_drop_texture()

func update_drop_texture():
	if drop:
		drop.texture = texture
	

func on_body_entered(body):
	var player := body as Player
	if player:
		emit_signal("player_picked_up", player)
		queue_free()
