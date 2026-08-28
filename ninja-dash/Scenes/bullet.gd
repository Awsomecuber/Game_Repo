extends Area2D

const SPEED: float = 350
var hit_points = 1
var hit:bool = false

func _process(delta: float) -> void:
	position += transform.x * SPEED * delta
	if hit == true:
		queue_free()
	

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Hurtbox"):
		hit = true
		print(hit)
		
