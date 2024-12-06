extends Area2D

@onready var animated_sprite = $AnimatedSprite2D

@export var jump_force = 300

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		animated_sprite.play("Jump")
		body.jump(jump_force)
