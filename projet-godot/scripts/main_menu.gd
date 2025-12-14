extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_credit_pressed() -> void:
	$Credit.show()
	$Credit.grab_focus.call_deferred()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	$Credit.hide()
	$Credit.grab_focus.call_deferred()
