extends TileMap

var board_size = 4 
enum Layers{hidden, revealed}
var SOURCE_NUM = 0
const hidden_tile_coords = Vector2(0,0)
const hidden_tile_alt = 1 
var revealed_spots = []
var tile_pos_to_atlas_pos = {}
var score = 0 
var turns_taken = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_tiles_to_use():
	var chosen_tile_coords = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
