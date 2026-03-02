extends Node3D

@export var player: Node3D
@export var target_material: StandardMaterial3D

func _process(_delta: float) -> void:
	global_position.x = player.global_position.x - 25
