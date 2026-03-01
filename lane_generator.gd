extends Node3D

@export var lane_scene: PackedScene
@export var player: Node3D 

var farthest_track: float
var lane_gap: float
var view_distance: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_trains()

func reset_trains():
	Global.farthest_track = 10.0
	lane_gap = 10.0
	view_distance = 50.0
	
	for child in get_children():
		child.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	while Global.farthest_track < (player.global_position.x + view_distance):
		spawn_lane()

func spawn_lane():
	var new_lane = lane_scene.instantiate()
	add_child(new_lane)
	new_lane.global_position.x = Global.farthest_track
	Global.farthest_track += lane_gap
