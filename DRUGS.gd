extends Node

@onready var player = get_node("/root/node_3d/Player_Spawn/Player")
@onready var shader_rect = get_node("root/Node3D/Player_Spawn/Player/ColorRect")

var normal_speed: float = 5.0
var effect_duration: float = 3.0

func anti_sanityanters():
	print("meow!")
	var the_random = randi_range(0, 2)
	
	if the_random == 0:
		print("DRUG TIME")
		if shader_rect:
			var mat = shader_rect.material as ShaderMaterial
			var tween = create_tween()
			tween.tween_property(mat, "shader_parameter/distortion_strength", 0.05, 0.5)
			
			await get_tree().create_timer(effect_duration).timeout
			
			var tween_back = create_tween()
			tween_back.tween_property(mat, "shader_parameter/distortion_strength", 0.0, 1.0)

	elif the_random == 1:
		print("FASTER")
		apply_speed_change(10.0)

	elif the_random == 2:
		print("SLOWER")
		apply_speed_change(2.0)

func apply_speed_change(new_speed: float):
	if player:
		Global.speed_boost = new_speed
		await get_tree().create_timer(effect_duration).timeout
		if is_instance_valid(player):
			Global.speed_boost = normal_speed

func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if body is CharacterBody3D:
		anti_sanityanters()
