extends TextureButton

func _ready():
	pass 

func _pressed():
	get_tree().set_pause(true)
	
