extends Node2D
class_name WeaponManager

signal weapon_changed(Weapon)

var default_weapon := preload("res://Player/Weapons/Gun/Gun.gd")

var current_weapon: BaseWeapon

func _ready():
	Console.remove_command("give_weapon")
	Console.add_command("give_weapon", self, "command_give_weapon")\
	.add_argument("weapon", TYPE_STRING)\
	.register()
	
	if get_child_count() == 0:
		change_weapon(default_weapon.new())
	else:
		self.current_weapon = get_child(0)
func command_give_weapon(name: String):
	var weapon_scn: Node = null
	match name.to_lower():
		"gun":
			weapon_scn = preload("res://Player/Weapons/Gun/Gun.gd").new()
		"laser":
			weapon_scn = preload("res://Player/Weapons/Laser/LaserGun.gd").new()
		"rpg":
			weapon_scn = preload("res://Player/Weapons/RPG/RPG.gd").new()
		"shotgun":
			weapon_scn = preload("res://Player/Weapons/Shotgun/Shotgun.gd").new()
		_:
			Console.write_line("Invlid weapon name")
			return
	change_weapon(weapon_scn)
	
func change_weapon(weapon: BaseWeapon):
	if current_weapon:
		current_weapon.queue_free()
	assert(weapon.connect("emit_bullet", self, "weapon_emit_bullet", [], CONNECT_PERSIST) == OK)
	add_child(weapon)
	current_weapon = weapon
	emit_signal("weapon_changed", weapon)

func weapon_emit_bullet(bullet: Node2D):
	get_parent().get_parent().add_child(bullet)

func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		current_weapon.try_shoot()

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		get_tree().set_input_as_handled()
		current_weapon.try_shoot()
