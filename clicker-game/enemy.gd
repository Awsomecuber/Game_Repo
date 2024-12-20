extends CharacterBody2D


const speed = 300
var health = 10



func _process(delta: float) -> void:
	var direction = (position - Vector2(-1,-1)).normalized()
	velocity = direction * speed * delta
	look_at(Vector2(0,0))
	move_and_slide()
