extends Area2D

signal picked_up  # signal for the HUD

@export var itemRes: InventoryItem

func collect(player_inventory: Inventory) -> void:
	if not itemRes:
		push_warning("No InventoryItem assigned to this Collectable!")
		return
	if not player_inventory:
		push_warning("Player inventory is null!")
		return

	print("Picked up:", itemRes.name)
	player_inventory.insert(itemRes)

	# Emit the signal so HUD can update instructions
	emit_signal("picked_up", itemRes.name)

	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player") and body.inventory:
		collect(body.inventory)
