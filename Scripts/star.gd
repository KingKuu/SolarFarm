extends Node3D
	
func _process(delta: float) -> void:
	rotation = lerp(rotation, rotation + Vector3(0.5, 0.5, 0.5), 0.01)
