extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var gun: Node2D = $Gun
@onready var book = preload("res://Scenes/Book.tscn")
var doing_smth = false



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	animate(direction)
	
	if Input.is_action_just_pressed("shoot"):
		shoot(direction)
	

	move_and_slide()
	

func shoot(direction: float):
	doing_smth = true
	var projectile = book.instantiate()
	projectile.global_position = gun.global_position
	projectile.global_rotation = gun.global_rotation
	if direction < 0 or sprite.flip_h == true:
		projectile.linear_velocity.x = -500.0
		
	animation.play("shoot")
	get_tree().root.add_child(projectile)
	
func animate(direction: float):
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
		
	
	if direction == 0 and doing_smth == false:
		animation.play("Idle")
	elif direction != 0 and doing_smth == false:
		animation.play("Walk")
		


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "shoot":
		doing_smth = false
