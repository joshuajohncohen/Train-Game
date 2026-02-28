extends Node3D
@onready var player = $Player
@onready var spawn = $Player_Spawn
func _ready():
	player.global_position = spawn.global_position
