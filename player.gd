extends CharacterBody2D

var speed = 200



func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("MoveUp"):
		velocity.y = -speed
	if Input.is_action_just_released("MoveUp"):
		velocity.y = 0
	if Input.is_action_pressed("MoveDown"):
		velocity.y = speed
	if Input.is_action_just_released("MoveDown"):
		velocity.y = 0
	if Input.is_action_pressed("MoveRight"):
		velocity.x = speed
	if Input.is_action_just_released("MoveRight"):
		velocity.x = 0
	if Input.is_action_pressed("MoveLeft"):
		velocity.x = -speed
	if Input.is_action_just_released("MoveLeft"):
		velocity.x = 0
	move_and_slide()
