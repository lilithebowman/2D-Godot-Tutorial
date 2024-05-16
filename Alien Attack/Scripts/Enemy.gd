extends Area2D

@export var speed = 300
@export var health = 100

func _physics_process(delta):
	global_position.x += -speed * delta
	
func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()
		print("Enemy health depleted; enemy destroyed!")
	
