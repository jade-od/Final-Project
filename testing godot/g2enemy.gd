extends CharacterBody2D
var gravity = 700
var speed = 100
var player_chase = false
var player = null
@onready var snake_player = $SnakeSprite2D

func _physics_process(delta):
		if Input.is_action_pressed("ui_right"):
			snake_player.play("snakeIdle")
			snake_player.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			snake_player.play("snakeIdle")
			snake_player.flip_h = true
	
func enemy():
	pass
		
func _on_area_2d_body_entered(body):
	player = body
	player_chase = true


func _on_area_2d_body_exited(body):
	player = null
	player_chase = false
