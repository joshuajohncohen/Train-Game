extends PathFollow3D

var speed: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_speed()
	loop_movement(delta)

func update_speed():
	speed = ((((Global.farthest_track - 10) / 10) ** 1.07) / 90) + 0.3

func loop_movement(delta):
	progress_ratio += speed * delta
