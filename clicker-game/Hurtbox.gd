extends Area2D

var Health = 10000000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../ProgressBar".value = Health
	


func _on_area_entered(area: Area2D) -> void:
	print("entered")
	Health = Health - 2
