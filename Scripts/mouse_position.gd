extends Node

var dragging:bool = false
var panning:bool = false

# Call this from any script using: MouseRaycaster.get_3d_mouse_position(camera, mask)
func get_3d_mouse_position(camera: Camera3D, collision_mask: int = 1) -> Vector3:
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_origin = camera.project_ray_origin(mouse_pos)
	var ray_end = ray_origin + camera.project_ray_normal(mouse_pos) * 2000.0
	
	var world3d = camera.get_world_3d()
	var space_state = world3d.direct_space_state
	
	var query = PhysicsRayQueryParameters3D.new()
	query.from = ray_origin
	query.to = ray_end
	query.collision_mask = collision_mask
	query.collide_with_areas = true
	
	var result = space_state.intersect_ray(query)
	
	if result:
		return result.position
	else:
		return Vector3.ZERO # Or handle lack of hit (e.g., return null)
