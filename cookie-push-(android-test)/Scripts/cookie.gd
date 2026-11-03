extends RigidBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
var gyro
	

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Spike"):
		print("hit")
		#sprite_2d.play("Cookie Break")
		
		
func _physics_process(delta: float) -> void:
	gyro = Input.get_gravity()
	apply_force(Vector2(gyro.x, -gyro.y)*1000)
	print(gyro)

	
	
