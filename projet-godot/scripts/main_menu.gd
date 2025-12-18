extends Control

var game_scene = preload("res://scenes/main.tscn").instantiate()
@onready var menu_music = $MenuAudio

func _ready():
	if not menu_music.playing:
		menu_music.play()
	HealthBar.hide_health_bar()

func _on_start_pressed() -> void:
	if menu_music.playing:
		menu_music.stop()
	var global_audio = GlobalAudio.get_node("AudioStreamPlayer")
	if not global_audio.playing:
		global_audio.play()
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	HealthBar.show_health_bar()


func _on_credit_pressed() -> void:
	$Credit.show()
	$Credit.grab_focus.call_deferred()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	$Credit.hide()
	$Credit.grab_focus.call_deferred()

func start_new_game():
	var inventory = preload("res://Inventory/playerInventory.tres")
	inventory.items.clear()
	inventory.emit_changed()

	global.current_health = global.max_health
	global.game_first_loadin = false
