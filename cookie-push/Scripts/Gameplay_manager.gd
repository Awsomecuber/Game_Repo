extends Node2D

var wake_meter: int = 0
var sleep: int = 1
var wake_up: int = 110
@onready var progress_bar: ProgressBar = $Camera2D/Control/ProgressBar
@onready var area_2d: Area2D = get_node_or_null("TileMapLayer/Area2D")
@onready var cookie: AnimatedSprite2D = $RigidBody2D/Sprite2D
const lose_screen = preload("res://Scenes/lose Screen.tscn")
const win_screen = preload("res://Scenes/win Screen.tscn")
var lose
var win
@onready var panda: RigidBody2D = $Panda
var results
@onready var lvl_name = scene_file_path.get_file().get_basename()

func _ready() -> void:
	lose = lose_screen.instantiate()
	win = win_screen.instantiate()
	print(lvl_name)
	print(Global.completed_levels.get(lvl_name))

func _physics_process(_delta: float) -> void:
	progress_bar.value  = wake_meter
	wake_meter = clamp(wake_meter, sleep, wake_up)
	if Input.is_action_pressed("tilt_left") or Input.is_action_pressed("tilt_right"):
		wake_meter += 1
	else:
		wake_meter -= 4
		
	if wake_meter >= wake_up:
		results = "Lose"
		
	if area_2d:
		if area_2d.hurt == true:
			cookie.play("Cookie Break")
			await get_tree().create_timer(.75).timeout
			results = "Lose"
		
	if panda.ate == true:
		results = "Won"
		Global.completed_levels[lvl_name] = true
		Global.completed(lvl_name.to_int())
		
	
	match results:
		"Won":
			add_child(win)
			get_tree().paused = true
		"Lose":
			add_child(lose)
			get_tree().paused = true
		_:
			pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
	
	
