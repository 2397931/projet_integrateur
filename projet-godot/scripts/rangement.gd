extends Node2D

@onready var reactorAudio1 = $AudioStreamPlayer
@onready var reactorAudio2 = $AudioStreamPlayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reactorAudio1.play()
	reactorAudio2.play()
	global.current_scene = "rangement"
	if global.game_first_loadin == true:
		$joueur.position.x = global.joueur_start4_posx
		$joueur.position.y = global.joueur_start4_posy
	else:
		$joueur.position.x = global.joueur_exit_rangement_posx
		$joueur.position.y = global.joueur_exit_rangement_posy


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_entrer_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		global.transition_scene = true


func _on_suite_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		global.transition_scene = false
