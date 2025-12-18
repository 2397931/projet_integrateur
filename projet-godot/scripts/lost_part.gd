extends Node2D

@onready var pickup = $AudioStreamPlayer
@export var itemRes: InventoryItem

func collect(inventory: Inventory):
	inventory.insert(itemRes)
	pickup.play()
	queue_free()

func _ready() -> void:
	# If already collected, remove it
	if self.name in global.key_founded:
		queue_free()

func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "joueur":
		global.key_founded.append(self.name)
		pickup.play()
		await get_tree().create_timer(pickup.stream.get_length()).timeout
		queue_free()
