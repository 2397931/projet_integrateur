extends Node2D

@onready var inventory: Inventory = preload("res://Inventory/playerInventory.tres")

@onready var laboAudio = $AudioStreamPlayer2

func _ready() -> void:
	laboAudio.play()
	global.current_scene = "infirmerie"
	global.current_scene_previous = "infirmerie"  # <-- important for spawn on exit

	# Spawn logic for entering infirmerie (if needed)
	if global.game_first_loadin:
		$joueur.position.x = global.joueur_start6_posx
		$joueur.position.y = global.joueur_start6_posy
	else:
		# If returning to infirmerie from another scene, you could handle exit spawn here too
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
