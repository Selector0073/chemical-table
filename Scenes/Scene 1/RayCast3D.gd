extends RayCast3D

@onready var camera = $Camera3D
var rayOrigin = Vector3()
var rayEnd = Vector3()

func _physics_process(delta):
	var space_state = get_world_3d().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	rayOrigin = camera.project_ray_origin(mouse_position)
	rayEnd = rayOrigin + camera.project_ray_normal(mouse_position) * 2000
	var intersection = space_state.intersect_ray(rayOrigin)
	if not intersection.is_empty():
		var pos = intersection.position
		$RayCast3D.look_at(Vector3(pos.x, pos.y, pos.z), Vector3(0,1,0))


func _process(delta):
	if is_colliding():
		print("coliding")
