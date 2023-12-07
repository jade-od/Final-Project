extends CharacterBody2D

var gravity = 500
var jumpheight = 350
var speed = 300

@onready var cat_player = $AnimationPlayer



func _physics_process(delta):
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -=jumpheight
		
	velocity.y +=gravity *  delta
func _process(_delta):
	# Player movement
	velocity.x = speed * Input.get_action_strength("ui_right") - speed * Input.get_action_strength("ui_left")
	move_and_slide() 
	if Input.is_action_pressed("ui_right"):
		cat_player.play("walking")
	else:
		cat_player.stop()
	
	#make sure they can only jump twice . 
	
	
	

