extends Node2D

var enemy_scene = preload("res://Scenes/Enemy.tscn")
var path_enemy_scene = preload("res://Scenes/path_enemy_2d.tscn")

signal enemy_spawned()
signal path_enemy_spawned()

@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout():
	spawn_enemy()
	
func _on_path_timer_timeout():
	spawn_path_enemy()

func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children()
	var enemy_instance = enemy_scene.instantiate()
	var random_spawn_position = spawn_positions_array.pick_random()
	enemy_instance.global_position = random_spawn_position.global_position
	emit_signal("enemy_spawned", enemy_instance)
	# add_child(enemy_instance)

func spawn_path_enemy():
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
	print("Path enemy spawned")
