extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var c = Card.new(4,12)
	$grid._add_child(c)

func _process(delta):
	pass
