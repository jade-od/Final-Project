extends CharacterBody2D

var gravity = 100
var jumpheight = 100
var speed = 100


func _physics_process(delta):
	if Input.is_action_pressed("jump"):
		velocity.y -=jumpheight
		
	velocity.y +=gravity *  delta
func _process(delta):
	# Player movement
	velocity.x = speed * Input.get_action_strength("ui_right") - speed * Input.get_action_strength("ui_left")
	move_and_slide() 
	
	
	
	
	
	
	
	
	
	

