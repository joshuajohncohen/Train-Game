extends RichTextLabel

func _ready():
	# Enable BBCode programmatically if not done in inspector
	bbcode_enabled = true
	add_theme_font_size_override("normal_font_size", 60)
	
func _process(_delta):
	# Setting text with bold and color tags
	text = "Points: " + str(Global.player_score)
