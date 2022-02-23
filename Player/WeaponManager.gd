extends Node2D

onready var current_weapon: BaseWeapon = get_node("Gun") 

func _ready():
	Console.remove_command("give_weapon")
	Console.add_command("give_weapon", self, "command_give_weapon")\
	.add_argument("weapon", TYPE_STRING)\
	.register()

func command_give_weapon(name: String):
	var weapon_scn: PackedScene = null
	match name.to_lower():
		"gun":
			weapon_scn = preload("res://Player/Weapons/Gun/Gun.tscn")
		"laser":
			weapon_scn = preload("res://Player/Weapons/Laser/LaserGun.tscn")
		"rpg":
			weapon_scn = preload("res://Player/Weapons/RPG/RPG.tscn")
		"shotgun":
			weapon_scn = preload("res://Player/Weapons/Shotgun/Shotgun.tscn")
		_:
			Console.write_line("Invlid weapon name")
			return
	change_weapon(weapon_scn.instance())

	
func change_weapon(weapon: BaseWeapon):
	current_weapon.queue_free()
	assert(weapon.connect("emit_bullet", self, "weapon_emit_bullet") == OK)
	add_child(weapon)
	current_weapon = weapon

func weapon_emit_bullet(bullet: Node2D):
	get_parent().get_parent().add_child(bullet)

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		get_tree().set_input_as_handled()
		current_weapon.try_shoot()
