extends Node2D

@onready var time = $"../Timer"
@export var enemy: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_timer_timeout() -> void:
	var enemyinst = enemy.instantiate()
	add_child(enemyinst)
