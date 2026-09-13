extends Sprite2D

const SPEED: float = 250.0
const STICK_DEADZONE: float = 0.2

enum InputMode { MOUSE, CONTROLLER }
var current_mode: InputMode = InputMode.MOUSE

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		current_mode = InputMode.MOUSE

func _process(delta: float) -> void:
	var stick_input = Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down")

	if stick_input.length() > STICK_DEADZONE:
		current_mode = InputMode.CONTROLLER
		global_position += stick_input * SPEED * delta
	elif current_mode == InputMode.MOUSE:
		global_position = get_global_mouse_position()
