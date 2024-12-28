extends Node2D

@onready var enemy = preload("res://Enemy.tscn")
@onready var timer = $Timer


func _on_timer_timeout() -> void:
	print("added enemy")
	var enemyinst = enemy.instantiate()
	add_child(enemyinst)
