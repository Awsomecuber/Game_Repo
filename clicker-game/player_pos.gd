extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"/root/Global".get_pos(self)
	
func get_postion():
	return self.global_position
