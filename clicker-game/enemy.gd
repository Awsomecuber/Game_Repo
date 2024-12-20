extends CharacterBody2D


const speed = 100
var health = 10
@onready var target = $"Main Click/Marker2D"


func _process(delta: float) -> void:
	var direction = (position).normalized()
	velocity = direction * speed * delta
	look_at(Vector2(0,0))
	move_and_slide()
