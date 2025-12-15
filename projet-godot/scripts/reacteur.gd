extends Node2D

@onready var reactorAudio1 = $AudioStreamPlayer
@onready var reactorAudio2 = $AudioStreamPlayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reactorAudio1.play()
	reactorAudio2.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
