extends RichTextLabel

func _ready():
	# Enable BBCode programmatically if not done in inspector
	bbcode_enabled = true
	
	# Setting text with bold and color tags
	text = "This is [b]bold[/b] and this is [color=red]red[/color]."
	
	# Appending text without overwriting the whole buffer
	append_text("\n[wave amp=50 freq=2]This text is waving![/wave]")
