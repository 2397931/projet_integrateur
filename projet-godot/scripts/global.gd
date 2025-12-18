extends Node

var current_scene = "map_principale"
var transition_scene = false
var last_entrance := ""
var current_scene_previous := ""
var previous_scene := ""
var is_new_game := true


var death_count := 0
var max_deaths := 3

var next_scene := ""

var joueur_exit_reacteursuite_posx = 1753
var joueur_exit_reacteursuite_posy = 770
var joueur_exit_reacteur_posx = 1334
var joueur_exit_reacteur_posy = 913
var joueur_exit_mapprincipalesuite_posx = 1837
var joueur_exit_mapprincipalesuite_posy = 913
var joueur_exit_infirmerie_posx = 526
var joueur_exit_infirmerie_posy = 913
var joueur_exit_rangement_posx = 447
var joueur_exit_rangement_posy = 896

var joueur_entrer_posx = 464
var joueur_entrer_posy = 898
var joueur_start6_posx = 417
var joueur_start6_posy = 931
var joueur_start5_posx = 160
var joueur_start5_posy = 770
var joueur_start4_posx = 121
var joueur_start4_posy = 896
var joueur_start3_posx = 115
var joueur_start3_posy = 896
var joueur_start2_posx = 78
var joueur_start2_posy = 913
var joueur_start_posx = 185
var joueur_start_posy = 913

var health_bar: Node = null  # <-- new variable

var key_founded = []

var max_health := 6
var current_health := max_health

signal health_changed(value)

var game_first_loadin = true
# List of health kits the player has picked up
var collected_health_kits := []


func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "map_principale":
			current_scene = "map_principale_suite"
		else:
			current_scene = "map_principale"

func damage(amount: int):
	current_health = clamp(current_health - amount, 0, max_health)
	emit_signal("health_changed", current_health)

func heal(amount: int):
	current_health = clamp(current_health + amount, 0, max_health)
	emit_signal("health_changed", current_health)

func reset_health():
	current_health = max_health
	emit_signal("health_changed", current_health)
	

func register_death():
	death_count += 1

	if death_count >= max_deaths:
		get_tree().paused = true

		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
	else:
		reset_health()
