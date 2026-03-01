extends Node

@onready var player = get_node("/root/Node3D/Player_Spawn/Player")
@onready var shader_rect = get_node("/root/Node3D/Player_Spawn/Player/ColorRect")
var normal_speed: int = 1
var effect_duration: float = 3.0

func anti_sanityanters():
	print("meow!")
	var THE_CHILDS = get_node("../powerups").get_children()
	for tiny_humans in THE_CHILDS:
		tiny_humans.queue_free()
	var the_random = randi_range(0, 2)
	
	if the_random == 0:
		print("DRUG TIME")
		if shader_rect:
			await get_tree().create_timer(effect_duration).timeout
			

	elif the_random == 1:
		print("FASTER")
		apply_speed_change(2)

	elif the_random == 2:
		print("SLOWER")
		apply_speed_change(0.9)
	

func apply_speed_change(new_speed: int):
	if player:
		Global.speed_boost = new_speed
		await get_tree().create_timer(effect_duration).timeout
		if is_instance_valid(player):
			Global.speed_boost = normal_speed

func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if body is CharacterBody3D:
		anti_sanityanters()

func _process(delta: float) -> void:
	print(Global.speed_boost)
