extends Node2D

@export var lives = 3
var score = 0
@onready var hud = $UICanvasLayer/HUDControl
@onready var player = $PlayerCharacterBody2D
@onready var enemyHitSound = $EnemyHitSound
@onready var playerTakeDamageSound = $PlayerTakeDamageSound

func _ready():
	hud.set_score_label(score)
	hud.set_lives_left(lives)

func _on_enemy_death_zone_area_entered(area):
	print(area.name)
	area.queue_free()

func _on_player_character_body_2d_took_damage():
	playerTakeDamageSound.play()
	lives -= 1
	hud.set_lives_left(lives)
	if lives <= 0:
		print("you ded")
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		var game_over_scene = preload("res://Scenes/game_over_control.tscn")
		var game_over_instance = game_over_scene.instantiate()
		$UICanvasLayer/HUDControl.add_child(game_over_instance)
		game_over_instance.set_score(score)
		
		# end the game? queue_free()?
	else:
		print(lives)


func _on_enemy_area_2d_enemy_died(value):
	score += value
	print("Score: " + str(score))


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)
	
func _on_enemy_died(value):
	enemyHitSound.play()
	print("enemy died")
	score += value
	hud.set_score_label(score)
	print("Score: " + str(score))


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance):
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", _on_enemy_died)
