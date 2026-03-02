extends Node

@onready var player = get_node("/root/Node3D/Player_Spawn/Player")
@onready var shader_rect = get_node("/root/Node3D/Player_Spawn/Player/ColorRect")
@onready var effect_timer = Timer.new()

var normal_speed: float = 1.0
var effect_duration: float = 10.0

func _ready() -> void:
	add_child(effect_timer)
	effect_timer.one_shot = true
	effect_timer.timeout.connect(_on_effect_timeout)

func anti_sanityanters():
	print("meow!")
	var THE_CHILDS = get_node("../powerups").get_children()
	for tiny_humans in THE_CHILDS:
		tiny_humans.queue_free()
	
	var the_random = randi_range(0, 2)
	
	if the_random == 0:
		print("DRUG TIME")
		Global.scramble_controls = true
		if shader_rect:
			shader_rect.visible = true
		effect_timer.start(effect_duration)

	elif the_random == 1:
		print("FASTER")
		apply_speed_change(2.0)

	elif the_random == 2:
		print("SLOWER")
		apply_speed_change(0.5)

func apply_speed_change(new_speed: float):
	if player:
		Global.speed_boost = new_speed
		effect_timer.start(effect_duration)

func _on_effect_timeout():
	Global.speed_boost = normal_speed
	Global.scramble_controls = false
	if shader_rect:
		shader_rect.visible = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		anti_sanityanters()

func _process(delta: float) -> void:
	pass
