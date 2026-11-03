extends Control
var root_num

func _ready() -> void:
	var root_lvl = get_tree().current_scene.scene_file_path
	var root_file = root_lvl.get_file()
	var root_name = root_file.get_basename()
	root_num = root_name.to_int()

func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")


func _on_next_level_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Levels/"+str(root_num + 1) +".tscn")
