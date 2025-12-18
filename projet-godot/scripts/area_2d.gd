extends Area2D

@export var heal_amount := 2  # 1 heart = 2 hits
@export var kit_id: String = ""  # unique identifier for this health kit

func _ready():
	# If this kit was already collected, remove it immediately
	if kit_id in global.collected_health_kits:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	print("Body entered:", body.name)
	if body.has_method("player"):
		print("Player detected, health before:", global.current_health)
		global.heal(heal_amount)
		print("Health after:", global.current_health)
		if kit_id != "":
			global.collected_health_kits.append(kit_id)
		queue_free()
