extends CharacterBody3D
# https://opensourcegamers.com/wp-blog/2024/08/24/how-to-make-a-simple-3d-player-in-godot-4-0/
const SPEED = 10
const JUMP_VELOCITY = 5
const SENSITIVITY = .010
#Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var head = $Head
@onready var camera = $Head/Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotation.y = clamp(head.rotation.y, -1, 1)
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# if Input.is_action_just_pressed("respawn"):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_back", "move_forward")

	#Calculate the forward and right directions based on the camera orientation.
	var forward_dir = -camera.global_transform.basis.z
	var right_dir = camera.global_transform.basis.x

	#Calculate the direction the player should move.
	var direction = (forward_dir * input_dir.y + right_dir * input_dir.x).normalized()
	var SPEED = SPEED * Global.speed_boost
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
