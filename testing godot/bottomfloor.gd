extends Area2D

var character_falling = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.has_method("player"):
		character_falling = true
func falling():
	pass
