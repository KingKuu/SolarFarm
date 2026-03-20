extends Node3D

var rotationSpeed:float = 0.1
var starTarget:bool = false

func _process(delta: float) -> void:
	rotation.z = lerp(rotation.z, rotation.z + rotationSpeed, 0.05)

func _physics_process(delta: float) -> void:
	if $StarChecker.is_colliding():
		starTarget = true
	else:
		starTarget = false

func _on_cooldown_timeout() -> void:
	if starTarget == true:
		$ExtractTime.start()
		rotationSpeed = lerp(rotationSpeed, 10.0, 0.7)

func _on_extract_time_timeout() -> void:
	$Cooldown.start()
	rotationSpeed = lerp(rotationSpeed, 0.1, 0.5)
