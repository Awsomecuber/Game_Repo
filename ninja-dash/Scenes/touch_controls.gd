extends CanvasLayer

@onready var air: TouchScreenButton = $Air
@onready var left: TouchScreenButton = $Left
@onready var ground: TouchScreenButton = $Ground
@onready var jump: TouchScreenButton = $Jump
@onready var right: TouchScreenButton = $Right




func _on_air_pressed() -> void:
	air.modulate.a = .5

func _on_air_released() -> void:
	air.modulate.a = 1


func _on_right_pressed() -> void:
	right.modulate.a = .5


func _on_right_released() -> void:
	right.modulate.a = 1


func _on_left_pressed() -> void:
	left.modulate.a = .5


func _on_left_released() -> void:
	left.modulate.a = 1


func _on_ground_pressed() -> void:
	ground.modulate.a = .5


func _on_ground_released() -> void:
	ground.modulate.a = 1


func _on_jump_pressed() -> void:
	jump.modulate.a = .5


func _on_jump_released() -> void:
	jump.modulate.a = 1
