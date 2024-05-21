extends Node2D

@export var lives = 3
var score = 0
@onready var hud = $UICanvasLayer/HUDControl
@onready var player = $PlayerCharacterBody2D

func _ready():
	hud.set_score_label(score)

func _on_enemy_death_zone_area_entered(area):
	print(area.name)
	area.die()
	pass # Replace with function body.

func _on_player_character_body_2d_took_damage():
	lives -= 1
	if lives <= 0:
		print("you ded")
		player.die()
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
	print("enemy died")
	score += value
	hud.set_score_label(score)
	print("Score: " + str(score))
