extends Control

@onready var you = $You
@onready var wouldnt = $Wouldnt
@onready var fare = $Fare
@onready var evade = $Evade
@onready var text_objects = [you, wouldnt, fare, evade]



func _ready():
	# Enable BBCode programmatically if not done in inspector
	you.bbcode_enabled = true
	wouldnt.bbcode_enabled = true
	fare.bbcode_enabled = true
	evade.bbcode_enabled = true
	
	for text_object in text_objects:
		set_font_size(text_object)
	
func set_font_size(change_font_object):
	var font_size_random = randf_range(60, 73)
	change_font_object.add_theme_font_size_override("normal_font_size", font_size_random)
	return font_size_random
	
