extends Label

var splashes = load_splashes()

func load_splashes() -> Array:
	var splashes = []
	var splash_file := File.new()
	assert(splash_file.open("res://splashes.txt", File.READ) == OK)
	while !splash_file.eof_reached():
		var line := splash_file.get_line()
		splashes.push_back(line)
	# Remove an empty splash at the end
	splashes.pop_back()
	return splashes
func get_random_splash():
	return splashes[randi() % splashes.size()]

func display_random_splash():
	self.text = get_random_splash()

func _ready():
	load_splashes()
	display_random_splash()
