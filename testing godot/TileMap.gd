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
	var options = range(10)
	options.shuffle()
	for i in range((board_size) * int(board_size/2)):
		var current = Vector2(options.pop_back(),0)
		for j in range(2):
			chosen_tile_coords.append(current)
	chosen_tile_coords.shuffle()
	return chosen_tile_coords
	
func setup_board():
	var cards_to_use = get_tiles_to_use()
	for y in range(board_size):
		for x in range(board_size):
			var current_spot = Vector2(x,y)
			place_single_face_down_card(current_spot)
			var card_atlas_coords = cards_to_use.pop_back()
			title_pos_to_atlas_pos[current_spot] = card_atlas_coords
			self.set_cell(Layers.revealed , current_spot,
						SOUCRE_NUM, card_atlas_coords)
	
func place_single_face_down_card(coords: Vector2):
	self.set_cell(Layers.hidden, coords,
				SOURCE_NUM, hidden_tile_coords, hidden_tile_alt)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
