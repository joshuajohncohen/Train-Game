extends Node

@onready var player = get_node("/root/Node3D/Player_Spawn/Player")
@onready var shader_rect = get_node("/root/Node3D/Player_Spawn/Player/ColorRect")

var normal_speed: float = 1.0
var effect_duration: float = 3.0

var _speed_timer: SceneTreeTimer = null
var _control_timer: SceneTreeTimer = null

func anti_sanityanters():
	print("meow!")
	var THE_CHILDS = get_node("../powerups").get_children()
	for tiny_humans in THE_CHILDS:
		tiny_humans.queue_free()

	var the_random = randi_range(0, 2)

	if the_random == 0:
		print("DRUG TIME")
		apply_control_scramble()

	elif the_random == 1:
		print("FASTER")
		apply_speed_change(2.0)

	elif the_random == 2:
		print("SLOWER")
		apply_speed_change(0.5)

func apply_speed_change(new_speed: float):
	Global.speed_boost = new_speed

	# Cancel previous speed timer if still running
	if _speed_timer != null:
		_speed_timer.timeout.disconnect(_on_speed_timeout)

	_speed_timer = get_tree().create_timer(effect_duration)
	_speed_timer.timeout.connect(_on_speed_timeout)

func apply_control_scramble():
	Global.scramble_controls = true
	Global.scramble_toggled.emit()
	if shader_rect:
		shader_rect.visible = true

	# Cancel previous control timer if still running
	if _control_timer != null:
		_control_timer.timeout.disconnect(_on_control_timeout)

	_control_timer = get_tree().create_timer(effect_duration)
	_control_timer.timeout.connect(_on_control_timeout)

func _on_speed_timeout():
	Global.speed_boost = normal_speed
	_speed_timer = null

func _on_control_timeout():
	Global.scramble_controls = false
	Global.scramble_toggled.emit()
	if shader_rect:
		shader_rect.visible = false
	_control_timer = null

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		anti_sanityanters()
