extends Node2D
class_name Map

signal player_touched_ball
signal won
signal ball_popped(ball)

func _ready():
	Console.remove_command("spawn_ball")
	Console.add_command("spawn_ball", self, "command_spawn_ball")\
	.add_argument("ball_size", TYPE_INT)\
	.register()
	
	Console.remove_command("nuke")
	Console.add_command("nuke", self, "command_nuke")\
	.register()
	
	Console.remove_command("save")
	Console.add_command("save", self, "command_save")\
	.register()
	
	Console.remove_command("restore")
	Console.add_command("restore", self, "command_restore")\
	.register()

var saved_data
func command_save():
	saved_data = save_game()

func command_restore():
	load_game(saved_data)

func command_spawn_ball(size: int):
	var ball = preload("res://Ball/Ball.tscn").instance()
	ball.global_position = get_viewport().get_mouse_position()
	ball.size = size
	add_child(ball)

func command_nuke():
	for ball in get_tree().get_nodes_in_group("Balls"):
		ball.pop()

# Global var used to keep track if we've already won
var won = false
func _process(_delta):
	# Check if any balls still exist, if they don't win.
	# This is not the fastest way to do this,
	# but it's the least error prone and there is no need to optimize it.
	if len(get_tree().get_nodes_in_group("Balls")) == 0 and !won:
		won = true
		Console.write_line("Won the game")
		emit_signal("won")
	pass

func ball_popped(ball: Ball):
	emit_signal("ball_popped", ball)

func on_Player_touched_ball(_ball: Ball):
	emit_signal("player_touched_ball")
	
class SavedNode:
	var parent: NodePath
	var filename: String
	var data

# Note: This can be called from anywhere inside the tree. This function is
# path independent.
# Go through everything in the persist category and ask them to return a
# dict of relevant variables.
func save_game():
	var root: Node = self
	var saved_nodes = []
	for node in get_tree().get_nodes_in_group("Persist"):
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save_node"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.save_node()
		var saved := SavedNode.new()
		saved.data = node_data
		saved.filename = node.filename
		saved.parent = root.get_path_to(node.get_parent())
		# Store the save dictionary as a new line in the save file.
		saved_nodes.push_back(saved)
	return saved_nodes

# Note: This can be called from anywhere inside the tree. This function
# is path independent.
func load_game(saved_nodes: Array):
	for i in get_tree().get_nodes_in_group("Persist"):
		i.queue_free()

	saved_nodes.sort_custom(self, "sort_by_path_len")
	for saved in saved_nodes:
		# Firstly, we need to create the object and add it to the tree and set its position.
		var new_object = load(saved.filename).instance()
		new_object.load_node(saved.data)
		get_node(saved.parent).add_child(new_object)

func sort_by_path_len(a: SavedNode, b: SavedNode):
	return a.parent.get_name_count() < b.parent.get_name_count()
