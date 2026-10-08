extends RigidBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Spike"):
		print("hit")
		#sprite_2d.play("Cookie Break")
