extends Area2D

@onready var sprite1: Sprite2D = $Sprite2D
@onready var sprite2: Sprite2D = $Sprite2D2

@export var winning_scene: String = "res://scenes/winning_screen.tscn"

func _ready():
	sprite1.visible = true
	sprite2.visible = false

	# Connect body_entered signal to the Area2D itself
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Only trigger if the player enters
	if body.name != "joueur":
		return

	# Swap sprites
	sprite1.visible = false
	sprite2.visible = true

	# Change to winning screen
	if winning_scene != "":
		get_tree().change_scene_to_file(winning_scene)
	else:
		push_warning("No winning scene assigned!")
