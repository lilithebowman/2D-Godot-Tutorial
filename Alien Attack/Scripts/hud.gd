extends Control

@onready var score = $ScoreLabel
@onready var lives = $LivesLeftLabel

func set_score_label(new_score):
	score.text = "SCORE: " + str(new_score)

func set_lives_left(new_lives):
	lives.text = str(new_lives)
