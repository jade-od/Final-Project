extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://click_to_games.tscn")
