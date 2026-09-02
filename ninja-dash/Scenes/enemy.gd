extends CharacterBody2D
const SPEED = 50.0
const JUMP_VELOCITY = -400.0
@export var health: int = 5
@onready var label: Label = $Label
@onready var progress_bar: ProgressBar = $ProgressBar
var player: CharacterBody2D
var is_chaseable: bool= false

func _ready() -> void:
	player = Global.playerBody
	progress_bar.max_value = health

func _process(_delta: float) -> void:
	progress_bar.value = health
	label.text = "Health: %d" % health
	if health <= 0:
		queue_free()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_chaseable and is_instance_valid(player):
		chase()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func chase():
	var dir_x = sign(player.position.x - position.x)
	velocity.x = dir_x * SPEED

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Hitbox"):
		health -= area.hit_points

func _on_chase_enter_body_entered(_body: Node2D) -> void:
	print("Chase triggered by: ", _body.name)
	print("is_chaseable at ready: ", is_chaseable)
	is_chaseable = true

func _on_chase_exit_body_exited(_body: Node2D) -> void:
	is_chaseable = false
