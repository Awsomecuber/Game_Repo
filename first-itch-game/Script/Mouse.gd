extends RigidBody2D


var on_hand = false
var select = false
var aim_speed = 250
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#if event.double_click:
				#select = false
			#else:
				#select = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:	
	#if select == true and on_hand == true:
		#print("Mouse is on Hand and Clicking")
		#hand.global_position = get_global_mouse_position()

#func _on_hand_mouse_entered() -> void:
	#on_hand = true
			#
#
#func _on_hand_mouse_exited() -> void:
	#on_hand = false
	#print("Mouse is out of Hand")
	
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var input_dir = Input.get_vector("lstick_left","lstick_right","lstick_up","lstick_down")
	state.linear_velocity = input_dir * aim_speed
	
	if Input.is_action_just_pressed("foot"):
		state.linear_velocity.x = 2000
