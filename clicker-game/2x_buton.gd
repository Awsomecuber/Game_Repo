extends Button

@onready var main = $"../Main Click"

func _on_pressed() -> void:
	if main.coin >= 5:
		main.coin -= 5
		main.click += 2
	if main.coin < 4:
		print("Not Enough Coins")
		print("Balance: %s" % main.coin)
