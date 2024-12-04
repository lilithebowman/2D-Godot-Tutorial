extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

@export var gravity = 400
@export var jump_force = 200
@export var speed = 125

func _physics_process(delta: float) -> void:
	if is_on_floor() == false:
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
		if velocity.y > 500:
			velocity.y = 500 # clamp it at 500

	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	
	# animations
	if velocity.x != 0 && is_on_floor():
		animated_sprite.play("Run")
	else:
		animated_sprite.play("Idle") # default to Idle animation

	if velocity.y > 0:
		animated_sprite.play("Fall")
	elif velocity.y < 0:
		animated_sprite.play("Jump")
		
	move_and_slide()



#func _process(delta):
	#if Input.is_action_pressed("move_left"):
		#animated_sprite.play("Run")
	#elif Input.is_action_pressed("move_right"):
		#animated_sprite.play("Run")
	#elif Input.is_action_pressed("jump"):
		#animated_sprite.play("Jump")
	#else:
		#animated_sprite.play("Idle")

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
