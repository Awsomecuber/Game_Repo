extends TileMapLayer

var input: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("tilt_left"):
		global_rotation -= 0.01
	elif Input.is_action_pressed("tilt_right"):
		global_rotation += 0.01
	
