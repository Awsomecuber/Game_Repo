extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0

@export var health: int = 5
@onready var label: Label = $Label
@onready var progress_bar: ProgressBar = $ProgressBar
var player: CharacterBody2D


func _ready() -> void:
	pass



func _process(_delta: float) -> void:
	player = Global.playerBody
	progress_bar.value = health
	label.text = "Health: %d" % health
	if health <= 0:
		queue_free()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_instance_valid(player):
		var dir_x = sign(player.position.x - position.x)
		velocity.x = dir_x * SPEED
	

	move_and_slide()


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Hitbox"):
		health -= area.hit_points
