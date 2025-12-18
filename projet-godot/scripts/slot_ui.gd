extends Panel

signal item_used(item: InventoryItem)  # <<-- THIS is needed

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/item

var item: InventoryItem = null
var inventory: Inventory = null   # reference, NOT preload

func update(new_item: InventoryItem, inv: Inventory):
	item = new_item
	inventory = inv

	if !item:
		backgroundSprite.frame = 0
		itemSprite.visible = false
	else:
		backgroundSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = item.texture

func clear():
	item = null
	backgroundSprite.frame = 0
	itemSprite.visible = false

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		use_item()

func use_item():
	if not item:
		return

	# Emit the signal for the inventory UI to handle
	item_used.emit(item)


func remove_item_from_inventory():
	inventory.items.erase(item)
	inventory.emit_changed()
