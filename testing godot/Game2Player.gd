extends CharacterBody2D

var gravity = 400
var jumpheight = 500
var speed = 400
var health = 100
var player_alive = true
var score = 0
var bar

var enemy_in_range = false
var falling = false
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
	if Input.is_action_pressed("ui_left"):
		sprites.play("walking")
		sprites.flip_h = true
	if Input.is_action_pressed("jump"):
		sprites.play("run")
func _ready():
	bar =  get_node("ScoreLabelG2")
func _on_area_2d_body_entered(body):
	if body.has_method("enemy"):
		enemy_in_range = true
		health = health - 10
		var healthbar = $"Health Bar"
		healthbar.value = health
	if body.has_method("falling"):
		falling = true
	if body.has_method("coins"):
		score+= 20

func _on_area_2d_body_exited(body):
	if body.has_method("enemy"):
		enemy_in_range = false
		
func enemy_attack():
	if enemy_in_range:
		health = health - 10
		if health <= 0:
			Engine.time_scale = 0
			get_tree().change_scene_to_file("res://respawn.tscn")
			
			
func fellOffMap():
	if falling:
		health = 0
		Engine.time_scale = 0
		get_tree().change_scene_to_file("res://respawn.tscn")
	

	

		
func player():
	pass

func _on_check_button_pressed():
	$AudioStreamPlayer.stop()
