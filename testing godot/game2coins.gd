extends Node2D

var player_in_area = false

func _process(delta): 
	if player_in_area:
		$Sprite2D.hide()



func _on_coin_area_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
