##GLOBAL!!!
extends Node

#belongs to cat selection part 
var CatSelect = 0 

#memory game 
@onready var Play = get_node('/root/Game/')

var deck = Array()

var cardBack = preload("res://assests (card faces)/PNG/Cards (large)/card_back.png")

func _ready():
	fillDeck()
	dealDeck()

func fillDeck():
	deck.append(Card.new(1,1))
	
func dealDeck():
	Play.get_node('grid').add_child(deck[0])
