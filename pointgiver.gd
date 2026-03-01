extends Node3D

func POINTSYAY(body: Node3D) -> void:
	print_debug("points yay triggered " + str(body))
	
	if body is CharacterBody3D:
		Global.player_score += 1



func _on_area_3d_body_entered(body: Node3D) -> void:
	POINTSYAY(body)
	pass # Replace with function body.
