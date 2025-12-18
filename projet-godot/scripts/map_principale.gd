extends Node2D

@onready var hud = $CanvasLayer/instructionsHud  # Your HUD scene instance
@onready var signs = [$signArea1, $signArea2]    # Area2D signs
@onready var player = $joueur
@onready var camera: Camera2D = $joueur/Camera2D


func _ready() -> void:
	global.current_scene = "map_principale"

	# Spawn logic
	if global.game_first_loadin:
		player.position = Vector2(global.joueur_start_posx, global.joueur_start_posy)
	else:
		player.position = Vector2(global.joueur_exit_mapprincipalesuite_posx, global.joueur_exit_mapprincipalesuite_posy)


func _process(delta: float) -> void:
	change_scene()

# Scene change logic
func _on_suite_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		global.transition_scene = true

func _on_suite_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		global.transition_scene = false

func change_scene():
	if global.transition_scene:
		if global.current_scene == "map_principale":
			get_tree().change_scene_to_file("res://scenes/map_principale_suite.tscn")
			global.finish_changescenes()

# Inventory pause
func _on_inventory_ui_closed() -> void:
	get_tree().paused = false

func _on_inventory_ui_opened() -> void:
	get_tree().paused = true
