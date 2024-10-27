extends CharacterBody2D

var SPEED = 500
const JUMP_VELOCITY = -600


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("ui_right"):
		$CookieMan.flip_h = false
	if Input.is_action_just_pressed("ui_left"):
		$CookieMan.flip_h = true
	if Input.is_action_just_pressed("rush"):
		SPEED = 950
	if Input.is_action_just_released("rush"):
		SPEED = 500
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("boing s"):
		velocity.y = -500 # Replace with function body.
	if area.is_in_group("boing xl"):
		velocity.y = -1500
