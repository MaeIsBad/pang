extends VSplitContainer

onready var lives_counter: Label = $Placeholder/HBoxContainer/LivesLeft
onready var score_display: Label = $Placeholder/HBoxContainer/Score
onready var viewport: Viewport = $LevelContainer/Viewport/


func set_lives_counter(lives: int):
	lives_counter.text = String(lives)

func set_score(score: int):
	score_display.text = String(score)

func set_map(map: Map):
	var curr_map := viewport.get_child(0)
	curr_map.queue_free()
	viewport.call_deferred("remove_child",curr_map)
	viewport.call_deferred("add_child",map)
