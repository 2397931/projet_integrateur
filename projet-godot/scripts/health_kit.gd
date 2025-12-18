extends Node2D

@export var itemRes: InventoryItem

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		body.inventory.insert(itemRes)
		queue_free()
