extends Node

func _ready():
	# Seed the RNG
	var rng_seed = OS.get_unix_time()
	seed(rng_seed)
	# Log the seed for debugging
	print("RNG seed:", rng_seed)
