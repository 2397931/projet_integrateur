extends Node2D

@onready var pickup = $AudioStreamPlayer
@export var itemRes: InventoryItem

func collect(inventory: Inventory):
	inventory.insert(itemRes)
	pickup.play()
	queue_free()

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
