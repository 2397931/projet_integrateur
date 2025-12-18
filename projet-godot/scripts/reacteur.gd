extends Node2D

var player_in_door := false
var current_door := ""

func _ready() -> void:
	global.current_scene = "reacteur"

	# Spawn logic selon d'où on vient
	if global.game_first_loadin:
		$joueur.position = Vector2(global.joueur_start3_posx, global.joueur_start3_posy)
	else:
		match global.current_scene_previous:
			"rangement":
				$joueur.position = Vector2(global.joueur_entrer_posx, global.joueur_entrer_posy)
			"reacteur_suite":
				$joueur.position = Vector2(global.joueur_exit_reacteursuite_posx, global.joueur_exit_reacteursuite_posy)
			_:
				$joueur.position = Vector2(global.joueur_start3_posx, global.joueur_start3_posy)

func _process(delta: float) -> void:
	# Si le joueur est dans une porte et appuie sur E ("entrer")
	if player_in_door and Input.is_action_just_pressed("entrer"):
		if current_door == "suite":
			global.current_scene_previous = "reacteur"
			global.game_first_loadin = false
			get_tree().change_scene_to_file("res://scenes/reacteur_suite.tscn")
			global.finish_changescenes()

# -------- Porte "entrer" (retour depuis reacteur_suite ou autre) --------
func _on_entrer_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		global.current_scene_previous = "reacteur_suite"
		global.game_first_loadin = false
		get_tree().change_scene_to_file("res://scenes/map_principale_suite.tscn")
		global.finish_changescenes()

func _on_entrer_body_exited(body: Node2D) -> void:
	pass  # rien à faire ici

# -------- Porte "suite" (aller vers reacteur_suite) --------
func _on_suite_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		global.current_scene_previous = "reacteur_suite"
		global.game_first_loadin = false
		get_tree().change_scene_to_file("res://scenes/reacteur_suite.tscn")
		global.finish_changescenes()
