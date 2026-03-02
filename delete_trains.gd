extends Node3D

@export var trainType: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pathFollow = $Path3D/PathFollow3D
	pathFollow.trainType = trainType


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var camera = get_viewport().get_camera_3d()
	
	if camera:
		if global_position.x < (camera.global_position.x - 10.0):
			queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void: # trigger to kill player
	if body is CharacterBody3D:
		var resetNode = get_node("../..")
		if resetNode.has_method("player_reset"):
			resetNode.player_reset()
