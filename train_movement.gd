extends PathFollow3D

var speed = 0.2
var reversed_speed = -0.2
var target = 0.99

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	loop_movement(delta)

func loop_movement(delta):
	if progress_ratio < target:
		target = 0.99
		progress_ratio += delta * speed
	if progress_ratio > target:
		target = 0.01
		progress_ratio += delta * reversed_speed
