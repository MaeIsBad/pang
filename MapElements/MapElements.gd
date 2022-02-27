extends TileMap

var ladder_scn := preload("res://MapElements/Ladder.tscn")

enum Cell {
	LADDER = 0,
}

func _ready():
	create_ladders()
	
func create_ladders():
	var cells := get_used_cells_by_id(Cell.LADDER)
	cells.sort()
	cells.invert()
	
	var prev_ladder_step_pos: Vector2
	var ladder: Ladder
	for cell_pos in cells:
		if !prev_ladder_step_pos || cell_pos != prev_ladder_step_pos-Vector2(0.0,1.0):
			ladder = ladder_scn.instance()
			var world_pos = map_to_world(cell_pos)
			add_child(ladder)
			
			ladder.position = world_pos
			ladder.position.x += cell_size.x/2.0
			ladder.position.y += cell_size.y
			
			ladder.top -= cell_size.y
			ladder.bottom += 4.0
			
		ladder.top -= cell_size.y
		prev_ladder_step_pos = cell_pos
