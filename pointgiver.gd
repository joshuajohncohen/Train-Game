extends Area3D

func _on_body_entered(body: Node3D) -> void:
	# 'body' is the object that just entered
	if body.is_in_group("Player"):
		Global.player_score += 1
		print("The Player has entered the zone!")
	
	# Or check for a specific name/type
	if body is CharacterBody3D:
		print("A character entered: ", body.name)
