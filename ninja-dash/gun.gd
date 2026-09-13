extends Node2D

const BULLET = preload("res://Scenes/bullet.tscn")
@export var crosshair: Node2D

func _process(_delta: float) -> void:
	look_at(crosshair.global_position)
	
	#if rotation_degrees > 90 and rotation_degrees < 270:
		#scale.y = -1
	#else:
		#scale.y = 1

	if Input.is_action_just_pressed("shoot"):
		var bullet = BULLET.instantiate()
		get_tree().root.add_child(bullet)
		bullet.global_position = global_position
		bullet.rotation = rotation
