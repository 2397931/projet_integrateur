extends Resource
class_name Inventory

@export var items: Array[InventoryItem] = []

func insert(item: InventoryItem) -> void:
	if item == null:
		return

	items.append(item)
	emit_changed()
