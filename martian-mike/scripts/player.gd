extends CharacterBody2D
class_name Player

@onready var animated_sprite = $AnimatedSprite2D

@export var gravity = 400
@export var jump_force = 200
@export var speed = 125

func _physics_process(delta: float) -> void:
	if is_on_floor() == false:
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		jump(jump_force)
		if velocity.y > 500:
			velocity.y = 500 # clamp it at 500

	var direction = Input.get_axis("move_left", "move_right")

	velocity.x = direction * speed

	update_animations(direction)
	
	move_and_slide()

func update_animations(direction):
	if direction != 0:
		animated_sprite.flip_h = (direction ==  -1)

	# animations
	if velocity.x != 0 && is_on_floor():
		animated_sprite.play("Run")
	else:
		animated_sprite.play("Idle") # default to Idle animation

	if velocity.y > 0:
		animated_sprite.play("Fall")
	elif velocity.y < 0:
		animated_sprite.play("Jump")
		
func jump(force):
	velocity.y = -force
