extends Node3D

func _body_entered(body: Node3D) -> void:
	# 'body' is the object that just entered
	print_debug("mrow")
	print("aaaaa")
	Global.player_score += 1
	if body.is_in_group("Player"):
		print("The Player has entered the zone!")
	
	# Or check for a specific name/type
	if body is CharacterBody3D:
		print("A character entered: ", body.name)


func _on_area_3d_body_entered(body: Node3D) -> void:
	_body_entered(body)
	pass # Replace with function body.
