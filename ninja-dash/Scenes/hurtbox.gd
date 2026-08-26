extends Area2D

@export var health = 5
@onready var label: Label = $"../Label"


func _on_area_entered(area: Area2D) -> void:
	label.text = "Health: %d" % health
	health -= 1

	if health <= 0:
		get_parent().queue_free()
