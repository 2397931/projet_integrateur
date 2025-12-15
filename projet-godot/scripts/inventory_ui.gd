extends Control

signal opened
signal closed

@onready var inventory: Inventory = preload("res://Inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var isOpen = false

func _ready() -> void:
	inventory.changed.connect(update)
	update()

func update() -> void:
	for i in range(slots.size()):
		if i < inventory.items.size():
			slots[i].update(inventory.items[i])
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
