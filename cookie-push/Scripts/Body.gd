extends RigidBody2D

var ate:bool = false
@onready var panda: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Cookie"):
		ate = true
		
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("tilt_left") or Input.is_action_pressed("tilt_right"):
		panda.play("Waking up")
	else:
		panda.play("Sleeping")
