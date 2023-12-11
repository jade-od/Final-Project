extends CharacterBody2D

var gravity = 500
var jumpheight = 350
var speed = 400
var health = 100
var hit = false
@onready var cat_player = $AnimationPlayer
@onready var sprites = $AnimatedSprite2D


func _physics_process(delta):
	
	enemy_attack()
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -=jumpheight
	velocity.y +=gravity *  delta
func _process(_delta):
	# Player movement
	velocity.x = speed * Input.get_action_strength("ui_right") - speed * Input.get_action_strength("ui_left")
	move_and_slide() 
		
	if Input.is_action_pressed("ui_right"):
		sprites.play("walking")
		sprites.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		sprites.play("walking")
		sprites.flip_h = true
	else:
		sprites.stop()
		
		
func updateHealth():
	var healthbar = $"Health Bar"
	healthbar.value = health
	


func _on_area_2d_body_entered(body):
	hit = true
	health = health - 10
	updateHealth()

func _on_area_2d_body_exited(body):
	hit = false
		
func enemy_attack():
	if hit:
		print("Me-owch!")
