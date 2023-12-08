extends Node

#memory game 
@onready var Play = get_node('/root/matching/')

var deck = Array()

var cardBack = preload("res://assests (card faces)/PNG/Cards (large)/cat_card_back.png")

func _ready():
	#print_tree()
	fillDeck()
	dealDeck()

func fillDeck():
	#deck.append(Card.new(1,1))
	var s = 1 
	var v = 1 
	while s < 5:
		v = 1
		while v < 14:
			deck.append(Card.new(s,v))
			v = v + 1
		s += 1
	
func dealDeck():
	#Play.get_node('grid').add_child(deck[0]) #get_node('grid').
	var c = 0
	while c < deck.size():
		Play.get_node('grid').add_child(deck[c])
		c +=1
