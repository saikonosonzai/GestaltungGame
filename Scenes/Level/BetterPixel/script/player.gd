extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera_2d: Camera2D = $Camera2D
<<<<<<< Updated upstream
@export var bullet_time_duration := 0.0
@export var time_stop_duration := 0.0
@export var cooldown := 0.0
var can_use_bullet_time := true
=======
>>>>>>> Stashed changes

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("bullet_time"):
		activate_bullet_time()
	
	if Input.is_action_just_pressed("time_stop"):
		activate_time_stop()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_Left", "Move_Right")
	if direction:
		if direction == 1:
			animated_sprite_2d.flip_h = false
		if direction == -1:
			animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("Run")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

<<<<<<< Updated upstream

func activate_bullet_time():
	if GameState.unlocked_skills["bullet_time"]:
		if GameState.is_bullet_time or not can_use_bullet_time:
			return
		can_use_bullet_time = false
		GameState.is_bullet_time = true
		
		Engine.time_scale = 0.3
		await get_tree().create_timer(bullet_time_duration, true).timeout
		Engine.time_scale = 1.0
		GameState.is_bullet_time = false
		
		await get_tree().create_timer(cooldown, true).timeout
		can_use_bullet_time = true
		
func activate_time_stop():
	get_tree().paused = true
	await get_tree().create_timer(time_stop_duration, true).timeout
	get_tree().paused = false

=======
>>>>>>> Stashed changes
func _on_area_2d_body_entered(body: Node2D) -> void:
	camera_2d.limit_left = 784


func _on_area_2d_body_exited(body: Node2D) -> void:
	camera_2d.limit_left = -205
