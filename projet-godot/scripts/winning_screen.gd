extends Node2D

@onready var winning = $AudioStreamPlayer

func _on_retry_pressed():
	winning.play()
	get_tree().paused = false
	global.death_count = 0
	global.reset_health()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
