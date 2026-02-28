extends RichTextLabel
@onready var points = 0

func _ready():
	# Enable BBCode programmatically if not done in inspector
	bbcode_enabled = true
	
	# Setting text with bold and color tags
	text = "Points: " + str(points)
