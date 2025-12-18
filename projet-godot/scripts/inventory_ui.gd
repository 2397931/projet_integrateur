extends Control

signal opened
signal closed

@onready var inventory: Inventory = preload("res://Inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var isOpen = false

func _ready() -> void:
	inventory.changed.connect(update)

	for slot in slots:
		slot.item_used.connect(_on_slot_item_used)

	update()

func update() -> void:
	for i in range(slots.size()):
		if i < inventory.items.size():
			slots[i].update(inventory.items[i], inventory)
		else:
			slots[i].clear()

func open():
	visible = true
	isOpen = true
	opened.emit()

func close():
	visible = false
	isOpen = false
	closed.emit()

func _on_slot_item_used(item: InventoryItem):
	if item.name == "health":
		if global.current_health < global.max_health:
			global.heal(item.heal_amount)
			inventory.items.erase(item)
			inventory.emit_changed()
