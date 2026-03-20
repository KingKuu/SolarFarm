extends Node3D

func _process(delta: float) -> void:
	var followPosition = MousePosition.get_3d_mouse_position(get_viewport().get_camera_3d())
	if not MousePosition.panning:
		print(followPosition)
		if followPosition != Vector3.ZERO:
			MousePosition.dragging = true
		else:
			MousePosition.dragging = false
		
		if Input.is_action_pressed("Lclick") and MousePosition.dragging:
			position = Vector3(followPosition.x, position.y, followPosition.z)
