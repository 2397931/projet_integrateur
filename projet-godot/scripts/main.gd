extends Node2D

signal card_collected(card)

func collect_card(card):
	emit_signal("card_collected", card)

func _ready() -> void:
	HealthBar.show_health_bar()
	GlobalAudio.get_node("AudioStreamPlayer").play()
