extends Area3D

@onready var parent:Node3D = self.get_parent()

func _process(delta: float) -> void:
	var followPosition = MousePosition.get_3d_mouse_position(get_viewport().get_camera_3d())
	
	if not MousePosition.panning:
		if Input.is_action_pressed("Lclick") and followPosition != Vector3.ZERO:
			MousePosition.dragging = true
			parent.position = Vector3(followPosition.x, parent.position.y, followPosition.z)
		else:
			MousePosition.dragging = false
	else:
		MousePosition.dragging = false
