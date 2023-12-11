extends Node2D


func _on_home_pressed(): 
	get_tree().change_scene_to_file("res://main.tscn")
	

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://game_2.tscn")
