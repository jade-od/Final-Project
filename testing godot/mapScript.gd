extends Area2D

func _on_Area2D_body_entered(body):
	if "cat_player" in body.name:
		body.respawn()
	
	
	
	
