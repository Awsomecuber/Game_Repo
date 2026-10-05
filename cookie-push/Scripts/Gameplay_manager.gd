extends Node2D

var wake_meter: int = 0
var sleep: int = 1
var wake_up: int = 110
@onready var progress_bar: ProgressBar = $Camera2D/Control/ProgressBar
const lose_screen = preload("res://Scenes/lose Screen.tscn")
const win_screen = preload("res://Scenes/win Screen.tscn")
var lose
var win
@onready var guy: RigidBody2D = $Guy
var results

func _ready() -> void:
	lose = lose_screen.instantiate()
	win = win_screen.instantiate()

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	progress_bar.value  = wake_meter
	wake_meter = clamp(wake_meter, sleep, wake_up)
	if Input.is_action_pressed("tilt_left") or Input.is_action_pressed("tilt_right"):
		wake_meter += 2
	else:
		wake_meter -= 1
		
	if wake_meter >= wake_up:
		results = "Lose"
		
	if guy.ate == true:
		results = "Won"
	
	match results:
		"Won":
			add_child(win)
			get_tree().paused = true
		"Lose":
			add_child(lose)
			get_tree().paused = true
		_:
			pass
			
	
		
	
		
