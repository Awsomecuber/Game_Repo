extends Node2D

@onready var label: Label = $Label

func _process(_delta: float) -> void:
	var gyro = Input.get_gyroscope()
	
	label.text = "X coord: " + str(gyro.x)
