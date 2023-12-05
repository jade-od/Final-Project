extends Node2D

func _process(delta):
	match Game.CatSelect:
		0:
			get_node("CatSelect").play("blackcat")
		1:
			get_node("CatSelect").play("greycat")
		2:
			get_node("CatSelect").play("orangecat")

func _on_left_pressed():
	if Game.CatSelect > 0:
		Game.CatSelect -= 1 


func _on_right_pressed():
	if Game.CatSelect < 2:
		Game.CatSelect += 1 


func _on_select_pressed():
	get_tree().change_scene_to_file("res://click_to_games.tscn")
