extends Node

func _ready():
	# Seed the RNG
	var rng_seed = OS.get_unix_time()
	seed(rng_seed)
	# Log the seed for debugging
	print("RNG seed:", rng_seed)

	Console.add_command("timescale", self, "command_timescale")\
	.add_argument("scale", TYPE_REAL)\
	.register()

func command_timescale(scale: float):
	Engine.time_scale = scale
