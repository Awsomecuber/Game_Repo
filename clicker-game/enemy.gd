extends CharacterBody2D


const speed = 20
var health = 10
var dmg = 2
@onready var hit = $"/root/Global".dmg_hit
var is_entered = false
@onready var player_pos = $"/root/Global".position.get_postion()

func _ready() -> void:
	$"/root/Global".get_enemy(self)

func get_hit():
	return hit


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print("Mouse Entered")
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		health = health - hit
		print("Health: ", health)


func _process(delta: float) -> void:
	$ProgressBar.value = health
	if health <= 0:
		queue_free()
	
	
func _physics_process(delta: float) -> void:
	var direction = (player_pos - global_position).normalized()
	velocity = direction * speed
	look_at(player_pos)
	move_and_slide()
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	print("entereed too")
	queue_free()
