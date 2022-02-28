extends Sprite
tool

var path = "res://Assets/Level/Platforms/Space_background_%s.png"

enum BACKGROUND { ONE, TWO, THREE, FOUR } 
export(BACKGROUND) var Background = BACKGROUND.ONE setget set_background

func set_background(bg):
	Background = bg
	texture = load(path % (Background + 1))
