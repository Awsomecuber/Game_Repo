extends TextureButton

var current_lvl = Global.lvl
var lvl = self.name
var name_int = lvl.to_int()
@onready var label: Label = $Label
var label_text

func _ready() -> void:
	label_text = label.text
	var label_num = label_text.to_int()
	if  label_num <= current_lvl:
		self.disabled = false
		label.visible = true


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/"+ label_text +".tscn")
