extends Node3D

@onready var player = $Player_Spawn/Player
@onready var playerC = $Player_Spawn/Player/CharacterBody3D
@onready var head = $Player_Spawn/Player/CharacterBody3D/Head
@onready var camera = $Player_Spawn/Player/CharacterBody3D/Head/Camera3D
@onready var spawn = $Player_Spawn
@onready var laneGen = $LaneGenerator

func player_reset():
	playerC.velocity = Vector3.ZERO
	playerC.global_position = spawn.global_position
	head.rotation = Vector3.ZERO
	camera.rotation = Vector3.ZERO
	if Global.player_score > Global.high_score:
		Global.high_score = Global.player_score
		Global.deaths += 1
	Global.player_score = 0
	Global.speed_boost = 1
	if laneGen.has_method("reset_trains"):
		laneGen.reset_trains()
	pass


func _ready():
	playerC.global_position = spawn.global_position
