extends Node3D

var speed = 4.0
var target_position = Vector3.ZERO

func _process(delta):
	# Move towards the deathpoint's Z position
	global_position.z = move_toward(global_position.z, target_position.z, speed * delta)
	
	# Delete the block if it has arrived (or is close enough)
	if global_position.distance_to(target_position) < 0.1:
		queue_free()
