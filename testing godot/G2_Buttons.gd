extends Control

@onready var game_2 = $Game2Player/Camera2D/PauseMenuG2


func _on_resume_pressed():
	game_2.pauseMenu()


func _on_quit_pressed():
	get_tree().quit()
