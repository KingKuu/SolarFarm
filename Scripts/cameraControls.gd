extends Node3D

var cameraZoom: float = 3.0
var _pan_sensitivity = 0.01

func _process(delta: float) -> void:
	if $Camera.position.z != cameraZoom:
		$Camera.position.z = cameraZoom
		$Background.position.z = cameraZoom - 8

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			cameraZoom = lerp(cameraZoom, cameraZoom + 0.5, 0.5)
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			cameraZoom = lerp(cameraZoom, cameraZoom - 0.5, 0.5)
		cameraZoom = clampf(cameraZoom, 1, 8)
	
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var horizontal_move = -event.relative.x * _pan_sensitivity
		var vertical_move = event.relative.y * _pan_sensitivity
		
		translate(Vector3(horizontal_move, vertical_move, 0))
