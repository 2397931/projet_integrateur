extends CanvasLayer

var current_step := 0
var instructions := [
	"Welcome! Find the red card.",
	"Great! Now go to the next objective.",
	"Keep going..."
]

@onready var label = $Label  # whatever node shows the instruction

func _ready():
	update_instruction()

func update_instruction():
	if current_step < instructions.size():
		label.text = instructions[current_step]
	else:
		label.text = "All tasks completed!"

func next_instruction():
	current_step += 1
	update_instruction()
