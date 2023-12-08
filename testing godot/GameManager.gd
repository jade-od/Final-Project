extends Node

#memory game 
@onready var Play = get_node('/root/matching/')

var deck = Array()

var cardBack = preload("res://assests (card faces)/PNG/Cards (large)/card_back.png")

func _ready():
	#print_tree()
	fillDeck()
	dealDeck()

func fillDeck():
	deck.append(Card.new(1,1))
	
func dealDeck():
	Play.get_node('grid').add_child(deck[0]) #get_node('grid').
