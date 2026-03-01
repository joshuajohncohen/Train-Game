extends Node3D

@export var player: Node3D
@export var target_material: StandardMaterial3D

func _process(_delta: float) -> void:
	# 1. Safety check: make sure the nodes are linked in the Inspector
	if not player or not target_material:
		return
		
	# 2. Move the object to follow the player (with your +22 offset)
	global_position.x = player.global_position.x + 22
	
	# 3. Fix the "Swimming" texture
	# We take the global position and divide by the UV Scale (4.0).
	# This ensures the texture "stays behind" as the object moves forward.
	# fmod keeps the number small (0 to 1) to prevent jitter over long distances.
	
	var uv_x_scale = 4.0 
	target_material.uv1_offset.x = fmod(-global_position.x / uv_x_scale, 1.0)
