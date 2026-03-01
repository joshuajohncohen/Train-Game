extends Node3D

@onready var player = $Player_Spawn/Player
@onready var spawn = $Player_Spawn
@onready var laneGen = $LaneGenerator

func player_reset():
	player.global_position = spawn.global_position
	Global.player_score = 0
	if laneGen.has_method("reset_trains"):
		laneGen.reset_trains()

func _ready():
	player.global_position = spawn.global_position
