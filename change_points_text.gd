extends RichTextLabel

func _ready():
	# Enable BBCode programmatically if not done in inspector
	bbcode_enabled = true
	
func _process(_delta):
	# Setting text with bold and color tags
	text = "Points: " + str(Global.player_score)
