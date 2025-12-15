extends Node2D

@export var max_health := 6
var current_health := max_health
var heart_sprite: AnimatedSprite2D

func _ready():
	# Get the sprite node
	heart_sprite = $CanvasLayer/AnimatedSprite2D
	if heart_sprite:
		heart_sprite.stop()

	# Connect to global health signal
	global.health_changed.connect(update_health)

	# Update the health bar to current value
	update_health(global.current_health)

	# Hide initially (Main Menu)
	visible = false

func update_health(new_health: int) -> void:
	current_health = clamp(new_health, 0, max_health)

	if heart_sprite:
		heart_sprite.stop()
		heart_sprite.frame = max_health - current_health

# Call this manually when entering a scene
func show_health_bar():
	visible = true

# Call this manually when leaving a scene (like Main Menu)
func hide_health_bar():
	visible = false
