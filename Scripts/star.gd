extends Node3D

var health:int = 10

func _process(delta: float) -> void:
	rotation = lerp(rotation, rotation + Vector3(0.5, 0.5, 0.5), 0.01)
	
	if health <= 1:
		queue_free()
