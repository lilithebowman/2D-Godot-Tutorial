extends Area2D

@export var acceleration = 25
@export var speed = 300
var current_speed = -speed

func _physics_process(delta):
	global_position.x += current_speed * delta
	current_speed += acceleration
	current_speed = clampf(current_speed, -speed, speed)
