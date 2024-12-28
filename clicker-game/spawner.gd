extends Node2D

@onready var enemy = preload("res://Enemy.tscn")
@onready var timer = $"../Timer"

func _ready():
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout() -> void:
	print("added enemy")
	var enemyinst = enemy.instantiate()
	add_child(enemyinst)
