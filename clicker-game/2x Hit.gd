extends Button

@onready var main = $"../Player"
@onready var hit = $"/root/Global"
var add = 0



func _on_pressed() -> void:
	if main.coin >= 10:
		main.coin -= 10
		add = add + 2
		hit.set_hit(add)
		print("total hits:", hit.get_hit())
	if main.coin < 5:
		print("Not Enough Coins")
		print("Balance: %s" % main.coin)
