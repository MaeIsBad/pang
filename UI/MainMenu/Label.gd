extends Label

export(Array, String) var splashes =  []

func _ready():
	var rand_index:int = randi() % splashes.size()
	text = splashes[rand_index]

