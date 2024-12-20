extends Marker2D

@onready var time = $"../Timer"
@onready var enemy = preload("res://Enemy.tscn")
var pos = self.position



func _on_timer_timeout() -> void:
	var enemyinst = enemy.instantiate()
	add_child(enemyinst)
