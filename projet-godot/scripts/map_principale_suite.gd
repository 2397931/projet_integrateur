extends Node2D

var player_in_door := false  # track if player is in forward door area
var current_door := ""       # track which forward door the player is in

func _ready() -> void:
	global.current_scene = "map_principale_suite"

	# Spawn logic
	if global.game_first_loadin == true:
		$joueur.position.x = global.joueur_start2_posx
		$joueur.position.y = global.joueur_start2_posy
	else:
		match global.current_scene_previous:
			"infirmerie":
				$joueur.position.x = global.joueur_exit_infirmerie_posx
				$joueur.position.y = global.joueur_exit_infirmerie_posy
			"reacteur":
				$joueur.position.x = global.joueur_exit_reacteur_posx
				$joueur.position.y = global.joueur_exit_reacteur_posy
			_:
				$joueur.position.x = global.joueur_start2_posx
				$joueur.position.y = global.joueur_start2_posy

func _process(delta: float) -> void:
	# Only change scene for forward door when pressing interact
	if player_in_door and Input.is_action_just_pressed("entrer"):
		if current_door == "Area2D":
			get_tree().change_scene_to_file("res://scenes/infirmerie.tscn")
			global.current_scene_previous = "map_principale_suite"
			global.game_first_loadin = false
			global.finish_changescenes()

# Back door (left / arriere) → automatic scene change
func _on_arriere_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://scenes/map_principale.tscn")
		global.current_scene_previous = "map_principale_suite"
		global.game_first_loadin = false
		global.finish_changescenes()

# Forward door (Area2D in your tree) → requires pressing E
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_door = true
		current_door = "Area2D"

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_door = false
		current_door = ""
