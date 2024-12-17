extends CharacterBody2D

@onready var Main = $".."
@onready var click = $"../Main Click"
const speed = 10
var rng = RandomNumberGenerator.new()
var rand_x = rng.randi_range(-100,1000)
var rand_y = rng.randf_range(-100,1000)
var health = 10

func _process(delta: float) -> void:
	if rand_x > -100 or rand_x < 300 and rand_y > -200 and rand_y < 200:
		pass
	else:  
		position = Vector2(rand_x,rand_y)
		
	var direction = (click.position - position).normalized()
	velocity = direction * speed
	look_at(click.position)
	move_and_slide()
