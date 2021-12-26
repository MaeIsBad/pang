extends Camera2D

func _ready():
	assert(get_viewport().connect("size_changed", self,"update_border") == OK)
	update_border()
func update_border():
	$StaticBody2D.set_rect(get_viewport_rect())
