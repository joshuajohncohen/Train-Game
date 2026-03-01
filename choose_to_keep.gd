extends StaticBody3D

func _ready() -> void:
	var children = get_children()
	if children.is_empty(): 
		return 
	
	if (randi_range(0, 100) > 65):
		for child in children:
			child.queue_free()
	else:
		var keep_index = randi() % children.size()
		for i in range(children.size()):
			if i != keep_index:
				children[i].queue_free()
