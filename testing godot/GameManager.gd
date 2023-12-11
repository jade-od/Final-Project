extends Node

#memory game 
@onready var Play = get_node('/root/matching/')

var deck = Array()

var cardBack = preload("res://assests (card faces)/PNG/Cards (large)/cat_card_back.png")

var card1
var card2

var matchTimer = Timer.new()
var flipTimer = Timer.new()

func _ready():
	fillDeck()
	dealDeck()
	setupTimers()
	
func setupTimers():
	flipTimer.timeout.connect(turnOverCards)
	flipTimer.set_one_shot(true)
	add_child(flipTimer)
	
	matchTimer.timeout.connect(matchCardsAndScore)
	matchTimer.set_one_shot(true)
	add_child(matchTimer)

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

func chooseCard(c): #var c
	if card1 == null: 
		card1 = c
		card1.flip()
		card1.set_disabled(true)
	elif card2 == null:
		card2 = c
		card2.flip()
		card2.set_disabled(true)
		checkCards()

func checkCards():
	if card1.value == card2.value:
		matchTimer.start(1)
	else:
		flipTimer.start(1)

func turnOverCards():
	card1.flip()
	card2.flip()
	card1.set_disabled(false)
	card2.set_disabled(false)
	card1 = null
	card2 = null

func matchCardsAndScore():
	card1.set_modulate(Color(0.6,0.6,0.6,0.5))
	card2.set_modulate(Color(0.6,0.6,0.6,0.5))
	card1 = null
	card2 = null
