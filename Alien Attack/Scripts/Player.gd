extends CharacterBody2D

var speed = 300

func shoot():
	print("bang")
	var rocket_scene = load("res://Scenes/rocket.tscn")
	var rocket_instance = rocket_scene.instantiate()
	rocket_instance.global_position = global_position + Vector2 (100, 0)
	add_sibling(rocket_instance)
	pass

func _process(delta):
	if Input.is_action_just_pressed("Shoot"):
		shoot()

func _physics_process(delta):
	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("Up"):
		velocity.y = -speed
	elif Input.is_action_pressed("Down"):
		velocity.y = speed
	
	if Input.is_action_pressed("Left"):
		velocity.x = -speed
	elif Input.is_action_pressed("Right"):
		velocity.x = speed
	move_and_slide()
	
	global_position = global_position.clamp(Vector2(0, 0), get_viewport_rect().size)
	pass
