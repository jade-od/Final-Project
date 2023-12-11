extends TextureButton

class_name Card

var suit 
var value 
var face 
var back
# Called when the node enters the scene tree for the first time.
func _ready():
	set_h_size_flags(3)
	set_v_size_flags(3)
	set_ignore_texture_size(true)
	set_stretch_mode(TextureButton.STRETCH_KEEP_ASPECT_CENTERED)

#func _process(delta):
#	pass

func _init(s, v):
	value = v
	suit = s
	face = load("res://assests (card faces)/PNG/Cards (large)/card_"+str(suit)+"_"+str(value)+".png")
	back = GameManager.cardBack
	set_texture_normal(back)
	
func _pressed():
	GameManager.chooseCard(self)

func flip():
	if get_texture_normal() == back:
		set_texture_normal(face)
	else: 
		set_texture_normal(back)
