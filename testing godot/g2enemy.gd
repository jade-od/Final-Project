extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null

#func _physics_process(delta):
'''if player_chase:
		position += (player.position - position)/speed
		
	if Input.is_action_pressed("ui_right"):
		$snakeAnimator.flip_h = false
		
	else:
		$snakeAnimator.flip_h = true'''


func _on_area_2d_body_entered(body):
	player = body
	player_chase = true
	



func _on_area_2d_body_exited(body):
	player = null
	player_chase = false
