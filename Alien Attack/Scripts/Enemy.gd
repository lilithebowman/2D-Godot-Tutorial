extends CharacterBody2D

@export var speed = 300

func _physics_process(delta):
	velocity.x = -speed
	global_position.x += -speed * delta
