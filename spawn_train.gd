extends Node3D

@export var spawn_interval: float = 2.0
@onready var train_block = $train
@onready var spawn_point = self
@onready var death_point = $Deathpoint_train

func _ready():
	# Set up and start the timer
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = spawn_interval
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	if train_block:
		var new_block = train_block.instantiate()
		get_parent().add_child(new_block) # Add to world, not the spawner
		
		# Set initial position and give it the destination
		new_block.global_position = spawn_point.global_position
		new_block.target_position = death_point.global_position
