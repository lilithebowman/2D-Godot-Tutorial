extends Area2D

@export var speed = 300
@export var health = 100
@export var value = 100

signal died
signal took_damage

func _physics_process(delta):
	global_position.x += -speed * delta
	
func take_damage(damage):
	health -= damage
	emit_signal("took_damage")
	if health <= 0:
		die()
	
func die():
	emit_signal("died", value)
	queue_free()

func _on_body_entered(body):
	print(body.name)
	take_damage(100)
	queue_free()
	pass # Replace with function body.


func _on_died():
	die()
