extends VBoxContainer

export (String) var column_name setget update_col_name

onready var col_name_label := $ColumnName 
onready var scores_container := $ScrollContainer/VBoxContainer
var score_scn := preload("res://UI/ScoreboardUI/Score.tscn")


func _ready():
	update_col_name(column_name)

func update_col_name(col_name: String):
	column_name = col_name
	# Called before ready
	if(!col_name_label):
		return
	col_name_label.text = column_name

func set_scores(scores):
	for child in scores_container.get_children():
		scores_container.remove_child(child)
		child.queue_free()
	for score in scores:
		var score_inst := score_scn.instance()
		score_inst.score = score
		scores_container.add_child(score_inst)
