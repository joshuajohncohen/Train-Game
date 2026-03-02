extends PathFollow3D

var speed: float
var isMoving: bool = true
@export var trainType: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if trainType == "1":
		$A.queue_free()
	elif trainType == "A":
		$"1".queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_speed()
	loop_movement(delta)

func update_speed():
	if trainType == "1":
		speed = ((((Global.farthest_track - 10) / 10) ** 1.12) / 90) + 0.35
	if trainType == "A":
		speed = ((((Global.farthest_track - 10) / 10) ** 1.2) / 90) + 0.4

func loop_movement(delta):
	if progress_ratio > 0.99:
		progress_ratio = 0
		isMoving = false
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = randf_range(0.1, 0.65)
		timer.one_shot = true
		timer.start()
		timer.timeout.connect(start_moving)
	if isMoving:
		progress_ratio += speed * delta

func start_moving():
	isMoving = true
