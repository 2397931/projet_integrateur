extends Node2D

func _on_retry_pressed():
	get_tree().paused = false
	global.death_count = 0
	global.reset_health()
	get_tree().change_scene_to_file("res://scenes/main.tscn")
