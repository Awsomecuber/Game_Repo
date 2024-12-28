extends Button

var click = 1
var coin = 0
@onready var label = $Label

	
func _process(delta: float) -> void:
	label.text = "Coins: %s" %coin 


func _on_pressed() -> void:
	coin = coin + click
	print("Clicked: %s" %coin)
	
