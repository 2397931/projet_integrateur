extends Area2D



@export var message := "Un message défaut."

func show_message(_body):
	if not _body.has_method("player"):
		return

	var cam = get_viewport().get_camera_2d()
	var original_zoom = cam.zoom
	var target_zoom = original_zoom * 0.5
	var duration = 0.5
	var elapsed = 0.0

	# Smooth zoom in
	while elapsed < duration:
		elapsed += get_process_delta_time()
		cam.zoom = original_zoom.linear_interpolate(target_zoom, elapsed/duration)
		await get_tree().process_frame

	# Show message
	$Timer.start()
	$Message.show()
	$Message/Fond/Etiquette.text = message
	await $Timer.timeout
	$Message.hide()

	# Smooth zoom out
	elapsed = 0.0
	while elapsed < duration:
		elapsed += get_process_delta_time()
		cam.zoom = cam.zoom.linear_interpolate(original_zoom, elapsed/duration)
		await get_tree().process_frame


func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
