extends CharacterBody2D

@export var speed = 300
@export var health = 100
var rocket_scene = preload("res://Scenes/rocket.tscn")
@onready var rocket_container = $RocketContainerNode
@onready var laserFXSound = $LaserFXSound

signal took_damage

func shoot():
	print("bang")
	var rocket_instance = rocket_scene.instantiate()
	rocket_instance.global_position = global_position + Vector2 (100, 0)
	rocket_container.add_child(rocket_instance)
	laserFXSound.play()
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
	
func die():
	queue_free()

func take_damage(damage):
	print(damage)
	health -= damage
	if health <= 0:
		emit_signal("took_damage")
