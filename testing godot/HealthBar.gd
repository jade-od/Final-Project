extends TextureProgressBar

'''var bar_red = preload("res://assets/barHorizontal_red.png")
var bar_green = preload("res://assets/barHorizontal_green.png")
var bar_yellow = preload("res://assets/barHorizontal_yellow.png")'''

@onready var healthbar = $HealthBar
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent() and get_parent().get("max_health"):
		healthbar.max_value = get_parent().max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#global_rotation = 0
	pass
	
'''func update_healthbar(value):
	healthbar.texture_progress = bar_green
	if value < healthbar.max_value * 0.7:
		healthbar.texture_progress = bar_yellow
	if value < healthbar.max_value * 0.35:
		healthbar.texture_progress = bar_red
	if value < healthbar.max_value:
		show()
	healthbar.value = value'''
