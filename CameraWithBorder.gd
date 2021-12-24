extends Camera2D

func _ready():
	get_viewport().connect("size_changed", self,"update_border")
	update_border()
func update_border():
	$StaticBody2D.set_rect(get_viewport_rect())	
