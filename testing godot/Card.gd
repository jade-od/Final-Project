extends TextureButton

class_name Card

var suit 
var value 
var face 
var back
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass

func _init(s, v):
	value = v
	suit = s
	face = load("res://assests (card faces)/PNG/Cards (large)/card_"+str(suit)+"_"+str(value)+".png")
	back = GameManager.cardBack
	set_texture_normal(face)
