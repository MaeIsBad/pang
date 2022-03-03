extends VSplitContainer

onready var lives_counter: Label = $ColorRect/MarginContainer/HBoxContainer/Info/HBoxContainer/LivesLeft
onready var score_display: Label = $ColorRect/MarginContainer/HBoxContainer/Score/Score
onready var viewport: Viewport = $Main/ViewportContainer/Viewport
onready var glitch_texture: TextureRect = $Main/GlitchContainer/GlitchTexture
onready var weapon_texture: TextureRect = $ColorRect/MarginContainer/HBoxContainer/WeaponCharge/Weapon
onready var weapon_charge: ProgressBar = $ColorRect/MarginContainer/HBoxContainer/WeaponCharge/WeaponCharge


func set_lives_counter(lives: int):
	lives_counter.text = String(lives)

func set_score(score: int):
	score_display.text = String(score)

func set_map(map: Map):
	var curr_map := viewport.get_child(0)
	curr_map.queue_free()
	viewport.call_deferred("remove_child",curr_map)
	viewport.call_deferred("add_child",map)

func set_weapon_texture(texture: Texture):
	weapon_texture.texture = texture

func set_weapon_charge(amount: float):
	weapon_charge.value = amount

func glitch():
	glitch_texture.material.set_shader_param("fade",0.01)
	yield(get_tree().create_timer(0.1),"timeout")
	glitch_texture.material.set_shader_param("fade",0.00)	


