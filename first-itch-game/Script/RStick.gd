extends Sprite2D
var aim_speed = 250


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = Vector2(416,156)
	print("R" + str(global_position))
	print("L" + str(position))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("rstick_left","rstick_right","rstick_up","rstick_down")
	position = input_dir * aim_speed * delta * Vector2(10,10)
