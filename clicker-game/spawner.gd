extends Node2D

@onready var enemy = preload("res://Enemy.tscn")
@onready var timer = $Timer
var rng = RandomNumberGenerator.new()


func _on_timer_timeout() -> void:
	var rand = rng.randf_range(1,10)
	print("added enemy")
	var enemyinst = enemy.instantiate()
	add_child(enemyinst)
	timer.wait_time = rand
	print("timer: ", timer.wait_time)
