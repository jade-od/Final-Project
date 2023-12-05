extends Node2D



func _on_leave_pressed():
	get_tree().change_scene_to_file("res://click_to_games.tscn")
