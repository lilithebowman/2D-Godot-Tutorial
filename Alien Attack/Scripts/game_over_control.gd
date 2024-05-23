extends Control


func set_score(new_score):
	$Panel/ScoreLabel.text = "SCORE: " + str(new_score)
	pass


func _on_retry_button_pressed():
	print("Retry")
	get_tree().reload_current_scene()
	pass # Replace with function body.
