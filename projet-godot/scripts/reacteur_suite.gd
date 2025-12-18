extends Node2D

func _ready() -> void:
	global.current_scene = "reacteur_suite"

	if global.game_first_loadin:
		$joueur.position = Vector2(global.joueur_start5_posx, global.joueur_start5_posy)
	else:
		match global.current_scene_previous:  # utilisez current_scene_previous partout
			"reacteur":
				$joueur.position = Vector2(
					global.joueur_exit_reacteursuite_posx,
					global.joueur_exit_reacteursuite_posy
				)
			"rangement":
				$joueur.position = Vector2(
					global.joueur_entrer_posx,
					global.joueur_entrer_posy
				)
			_:
				$joueur.position = Vector2(global.joueur_start5_posx, global.joueur_start5_posy)

func _process(delta: float) -> void:
	change_scene()

# LEFT → go back to reacteur
func _on_entrer_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		global.transition_scene = true
		global.current_scene_previous = "reacteur_suite"

func _on_entrer_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		global.transition_scene = false

func change_scene():
	if global.transition_scene == true:
		if global.current_scene == "reacteur_suite":
			get_tree().change_scene_to_file("res://scenes/reacteur.tscn")
			global.finish_changescenes()


func _on_sortie_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://scenes/reacteur.tscn")
		global.current_scene_previous = "rangement" # 🔥 THIS WAS MISSING
		global.game_first_loadin = false
		global.finish_changescenes()


func _on_inventory_ui_closed() -> void:
	get_tree().paused = false

func _on_inventory_ui_opened() -> void:
	get_tree().paused = true
