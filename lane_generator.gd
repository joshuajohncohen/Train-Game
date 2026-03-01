extends Node3D

@export var lane_scene: PackedScene
@export var player: Node3D 

var farthest_track: float = 10.0
var lane_gap: float = 10.0
var view_distance: float = 50.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	while farthest_track < (player.global_position.x + view_distance):
		spawn_lane()

func spawn_lane():
	var new_lane = lane_scene.instantiate()
	add_child(new_lane)
	new_lane.global_position.x = farthest_track
	farthest_track += lane_gap
