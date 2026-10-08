extends Area2D

var hurt = false


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Cookie"):
		hurt = true
