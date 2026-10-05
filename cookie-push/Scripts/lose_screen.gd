extends Control


func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	

func _on_menu_pressed() -> void:
	pass # Replace with function body.
