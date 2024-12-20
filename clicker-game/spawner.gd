extends Marker2D

@onready var time = $"../Timer"
@onready var enemy = preload("res://Enemy.tscn")



func _on_timer_timeout() -> void:
	var enemyinst = enemy.instantiate()
	add_child(enemyinst)
