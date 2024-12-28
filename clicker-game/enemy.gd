extends CharacterBody2D


const speed = 100
var health = 10
@onready var player_pos = $"/root/Global".position.get_position()



func _process(delta: float) -> void:
	var direction = (player_pos - position).normalized()
	velocity = direction * speed
	look_at(player_pos)
	move_and_slide()
