extends Control

@onready var label = $instructionLabel

func show_instruction(text: String):
	label.text = text
	visible = true
	# Automatically hide after 3 seconds
	await get_tree().create_timer(3.0).timeout
	visible = false

var step := 0

func next_instruction() -> void:
	step += 1
	match step:
		1:
			label.text = "You picked up the red card!"
			label.visible = true
		2:
			label.text = "Go to the infirmary"
		_:
			label.visible = false
