extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -350.0
const launch_speed: float = 750.0
const base_angle_degrees: float = -45.0
var is_doing_smth: bool = false
var cooldown_time: float = .7
var cooldown_remaining: float = 0.0
var facing_direction: float = 1.0  # remembers last facing direction
var direction :float=0

#@onready var hitbox: Area2D = $Hitbox
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	direction = Input.get_axis("move_left", "move_right")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if not is_doing_smth:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	# Tick down cooldown
	if cooldown_remaining > 0:
		cooldown_remaining -= delta

	if Input.is_action_just_pressed("air_attack") and cooldown_remaining <= 0:
		attack(base_angle_degrees)
		animation_player.play("Air_attack")
			
	if Input.is_action_just_pressed("ground_attack") and is_on_floor() and cooldown_remaining <= 0:
		attack(0)
		animation_player.play("Ground_attack")

			
	animate()

	move_and_slide()

func animate():
	if direction > 0:
		animated_sprite.flip_h = false
		facing_direction = 1
	elif direction < 0:
		animated_sprite.flip_h = true
		facing_direction = -1
		
	if not is_doing_smth:
		if direction == 0:
			animation_player.play("Idle")
		else:
			animation_player.play("Run")
			
		if not is_on_floor():
			animation_player.play("Jump")

func attack(angle: float) -> void:
	var angle_rad = deg_to_rad(angle)
	velocity = Vector2(cos(angle_rad) * facing_direction, sin(angle_rad)) * launch_speed
	cooldown_remaining = cooldown_time
	is_doing_smth = true
	#hitbox.monitorable = true



func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	is_doing_smth = false
	#hitbox.monitorable = false
