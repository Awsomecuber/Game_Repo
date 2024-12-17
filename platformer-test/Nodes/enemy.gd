extends Area2D

var damage = 10

func _on_body_entered(body: CharacterBody2D) -> void:
		body.take_damage(damage)
		
