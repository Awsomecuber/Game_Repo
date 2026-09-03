extends CharacterBody2D
const SPEED = 50.0
const JUMP_VELOCITY = -400.0
@export var health: int = 5
@onready var label: Label = $Label
@onready var progress_bar: ProgressBar = $ProgressBar
var player: CharacterBody2D
var is_chaseable: bool= false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	player = Global.playerBody
	progress_bar.max_value = health

func _process(_delta: float) -> void:
	progress_bar.value = health
	label.text = "Health: %d" % health
	if health <= 0:
		queue_free()

func _physics_process(delta: float) -> void:
	var dir_x: float = 0
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_chaseable and is_instance_valid(player):
		dir_x = chase()
		animation_player.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation_player.play("Idle")
		
	animate(dir_x)

	move_and_slide()
	
func animate(dir_x: float):
	if  dir_x > 0:
		animated_sprite.flip_h = true
		animated_sprite.offset.x = 5
	elif dir_x < 0:
		animated_sprite.flip_h = false
		animated_sprite.offset.x = 0

func chase() -> float:
	var dir_x = sign(player.position.x - position.x)
	velocity.x = dir_x * SPEED
	return dir_x

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Hitbox"):
		health -= area.hit_points

func _on_chase_enter_body_entered(_body: Node2D) -> void:
	print("Chase triggered by: ", _body.name)
	print("is_chaseable at ready: ", is_chaseable)
	is_chaseable = true

func _on_chase_exit_body_exited(_body: Node2D) -> void:
	is_chaseable = false
