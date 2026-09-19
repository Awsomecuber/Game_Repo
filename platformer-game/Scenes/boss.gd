extends CharacterBody2D

var health = 100
const SPEED = 300.0
const JUMP_VELOCITY = -40
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var is_hit:bool = false


func _ready() -> void:
	progress_bar.max_value = health

func _process(_delta: float) -> void:
	
	progress_bar.value = health
	if health == 0:
		queue_free()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	global_position += velocity
		
	move_and_slide()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Hitbox"):
		sprite.play("Hit")
		health-= 1
		body.queue_free()
		is_hit = true
		
		

func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "Hit":
		sprite.play("Idle")
