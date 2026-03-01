extends Control

@onready var text_objects = [$You, $Wouldnt, $Fare, $Evade]
@onready var random_areas = [$RandomAreas/YouArea, $RandomAreas/WouldntArea, $RandomAreas/FareArea, $RandomAreas/EvadeArea]

func _ready():
	for i in range(text_objects.size()):
		var text_node = text_objects[i]
		var area_node = random_areas[i]
		
		text_node.bbcode_enabled = true
		set_font_size(text_node)
		move_randomly_in_container(text_node, area_node)

func set_font_size(node: RichTextLabel):
	var size = randf_range(60, 73)
	node.add_theme_font_size_override("normal_font_size", size)

func move_randomly_in_container(node: Control, area: Control):
	var area_rect = area.get_global_rect()
	var max_x = area_rect.size.x - node.size.x
	var max_y = area_rect.size.y - node.size.y
	max_x = max(0, max_x)
	max_y = max(0, max_y)

	var random_x = randf_range(area_rect.position.x, area_rect.position.x + max_x)
	var random_y = randf_range(area_rect.position.y, area_rect.position.y + max_y)
	
	node.global_position = Vector2(random_x, random_y)
