extends Node2D

var enemy_scene = preload("res://Scenes/Enemy.tscn")

signal enemy_spawned()

@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout():
	spawn_enemy()
	print("Timed out")

func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children()
	var enemy_instance = enemy_scene.instantiate()
	var random_spawn_position = spawn_positions_array.pick_random()
	enemy_instance.global_position = random_spawn_position.global_position
	emit_signal("enemy_spawned", enemy_instance)
	# add_child(enemy_instance)
