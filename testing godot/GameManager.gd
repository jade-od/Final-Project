extends Node
#memory game 
@onready var Play = get_node('/root/matching/')
var deck = Array()
var cardBack = preload("res://assests (card faces)/PNG/Cards (large)/cat_card_back.png")
var card1
var card2
var matchTimer = Timer.new()
var flipTimer = Timer.new()
var secondsTimer = Timer.new()
var score = 0
var seconds = 0
var moves = 0 

var scoreLabel
var timerLabel 
var movesLabel

var resetButton

func _ready():
	fillDeck()
	dealDeck()
	setupTimers()
	setupHUD()
	
func resetGame():
	for c in range(deck.size()):
		deck[c].queue_free()
	deck.clear()
	score = 0
	seconds = 0 
	moves = 0 
	scoreLabel.text = str(score)
	timerLabel.text = str(seconds)
	movesLabel.text = str(moves)
	fillDeck()
	dealDeck()
	
func setupHUD():
	scoreLabel = Play.get_node('HUD/Panel/Sections/SectionScore/Score')
	timerLabel = Play.get_node('HUD/Panel/Sections/SectionTimer/Seconds')
	movesLabel = Play.get_node('HUD/Panel/Sections/SectionMoves/Moves')
	scoreLabel.text = str(score)
	timerLabel.text = str(seconds)
	movesLabel.text = str(moves)
	resetButton = Play.get_node('HUD/Panel/Sections/SectionButtons/ButtonReset')
	resetButton.pressed.connect(resetGame)
	
func setupTimers():
	flipTimer.timeout.connect(turnOverCards)
	flipTimer.set_one_shot(true)
	add_child(flipTimer)
	
	matchTimer.timeout.connect(matchCardsAndScore)
	matchTimer.set_one_shot(true)
	add_child(matchTimer)
	
	secondsTimer.timeout.connect(countSeconds)
	add_child(secondsTimer)
	secondsTimer.start()

func countSeconds():
	seconds += 1 
	timerLabel.text = str(seconds)

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
	deck.shuffle()
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
		moves  += 1 
		movesLabel.text = str(moves)
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
	score += 1
	scoreLabel.text = str(score)
	card1.set_modulate(Color(0.6,0.6,0.6,0.5))
	card2.set_modulate(Color(0.6,0.6,0.6,0.5))
	card1 = null
	card2 = null
	print(score)
