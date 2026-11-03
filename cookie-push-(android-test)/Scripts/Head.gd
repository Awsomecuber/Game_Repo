extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.collision_layer == 1:
		print("Game Over")
