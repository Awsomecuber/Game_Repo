extends CharacterBody2D


const speed = 10
var health = 10

func _process(delta: float) -> void:
		
	var direction = (position - Vector2(0,0)).normalized()
	velocity = direction * speed
	look_at(Vector2(0,0))
	move_and_slide()
