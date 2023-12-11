extends TextureButton

func _ready():
	pass 

func _pressed():
	if !get_tree().is_paused():
		get_tree().set_pause(true)
		set_texture_normal(load('res://assests (card faces)/pausestart/play.png'))
	elif get_tree().is_paused():
		get_tree().set_pause(false)
		set_texture_normal(load('res://assests (card faces)/pausestart/pause.png'))
	
