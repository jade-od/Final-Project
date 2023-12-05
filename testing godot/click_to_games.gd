extends Node2D

func _on_game_1_pressed():
	get_tree().change_scene_to_file("res://game_1.tscn")

func _on_game_2_pressed():
	get_tree().change_scene_to_file("res://game_2.tscn")

func _on_game_3_pressed():
	get_tree().change_scene_to_file("res://game_3.tscn")

func _on_return_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


