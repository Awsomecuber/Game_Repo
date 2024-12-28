extends Area2D

var Health = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../ProgressBar".value = Health
	if Health <= 0:
		get_tree().quit()
	


func _on_area_entered(area: Area2D) -> void:
	print("entered")
	Health = Health - 2
