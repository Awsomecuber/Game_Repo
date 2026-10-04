extends Node2D

var wake_meter: int = 0
var sleep: int = 1
var wake_up: int = 99
@onready var progress_bar: ProgressBar = $ProgressBar

func _physics_process(_delta: float) -> void:
	progress_bar.value  = wake_meter
	wake_meter = clamp(wake_meter, sleep, wake_up)
	if Input.is_action_pressed("tilt_left") or Input.is_action_pressed("tilt_right"):
		wake_meter += 2
	else:
		wake_meter -= 1
		
	
	
	if wake_meter >= wake_up:
		print("Game Over")
		
