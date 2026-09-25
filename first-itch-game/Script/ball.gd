extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	

func _on_body_entered(body: Node) -> void:
	var current_level = Global.level
	if body.is_in_group("wall"):
		Global.add_score()
		Global.add_level()
	
		if Global.level == current_level + 1:
			mass -= 0.1
			current_level = Global.level
			print(str(mass))
		
	
		
