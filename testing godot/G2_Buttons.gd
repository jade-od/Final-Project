extends Control

@onready var game_2 = $"../../../"


func _on_resume_pressed():
	game_2.pauseMenu()


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://click_to_games.tscn")


