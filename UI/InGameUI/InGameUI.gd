extends VSplitContainer

func update_lives(lives: int):
	$Placeholder/HBoxContainer/LivesLeft.text = String(lives)

func lose():
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")

func set_map(map: Map):
	var old_map = $LevelContainer/Viewport/Map
	old_map.replace_by(map)
	old_map.queue_free()
	update_lives(map.lives)

	map.connect("player_lives_changed", self, "update_lives")
	map.connect("lost", self, "lose")
