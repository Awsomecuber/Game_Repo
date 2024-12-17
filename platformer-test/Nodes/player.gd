extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var Health = 100
	
	
@onready var anim = $AnimatedSprite2D
@onready var label = $"../Label"

func take_damage(dmg: int):
	Health -= dmg
	label.text = "Health: %s" % Health
	if Health < 100 and Health > 0 or Health > 100:
		print("Health %s" % Health)
		
	elif Health == 0 or Health < 0:
		print("You Died")
	
	
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		anim.flip_h = false
	if direction < 0:
		anim.flip_h = true
		
	if direction:
		velocity.x = direction * SPEED
		anim.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			anim.play("idle")

	move_and_slide()
	
	if velocity.y > JUMP_VELOCITY and !is_on_floor():
		anim.play("Jump")
	if velocity.y > 0:
		anim.play("Falling")
		
