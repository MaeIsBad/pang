extends TileMap

const GLASS_TILE_ID := 1

func touched_bullet(bullet):
	var bullet_pos := to_local(bullet.global_position)
	
	var mappos := world_to_map(bullet_pos)
	break_glass(mappos)

func break_glass(glass_pos: Vector2):
	if(get_cellv(glass_pos) == GLASS_TILE_ID):
		set_cellv(glass_pos,-1)
		break_glass(glass_pos+Vector2(0.0,1.0))
		break_glass(glass_pos+Vector2(0.0,-1.0))
		break_glass(glass_pos+Vector2(1.0,0.0))
		break_glass(glass_pos+Vector2(-1.0,0.0))

# Save the broken glass since that's the only cell that can change
func save_node():
	return {
		"glass_cells": self.get_used_cells_by_id(GLASS_TILE_ID)
	}

func load_node(data: Dictionary):
	# Clear all the glass cells
	for cell in self.get_used_cells_by_id(GLASS_TILE_ID):
		self.set_cellv(cell, -1)
	# Put the saved cells back
	for cell in data["glass_cells"]:
		self.set_cellv(cell, GLASS_TILE_ID)
