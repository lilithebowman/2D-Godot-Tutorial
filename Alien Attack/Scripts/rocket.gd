extends Area2D

@export var acceleration = 25
@export var speed = 300
@onready var visibleOnScreenNotifier = $VisibleOnScreenNotifier2D
var current_speed = -(speed / 2)

func _ready():
	visibleOnScreenNotifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	global_position.x += current_speed * delta
	current_speed += acceleration
	current_speed = clampf(current_speed, -speed, speed)

func _on_screen_exited():
	print("Rocket exited screen")
	queue_free()
	pass
