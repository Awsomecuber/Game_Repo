extends Node2D

@export var treasure_list: Array[base_treasure]
var odds: PackedFloat32Array = [0.00000064,0.00000727272,0.00012799180852425,0.0017605633802817, 0.0025575447570332, 0.0036764705882353, 0.0078740157480315,0.0078740157480315,0.0078740157480315,0.0078740157480315,0.0078740157480315,0.9524994382]
var rand = RandomNumberGenerator.new()
var counter:int
@onready var text: RichTextLabel = $Control/RichTextLabel
@onready var counter_text: Label = $Control/Counter
var found_treasure: Array
@onready var checklist: RichTextLabel = $Control/Checklist

var treasure
var sum = 0

func _on_button_pressed() -> void: 
	treasure = treasure_list[rand.rand_weighted(odds)]
	text.text = "You Got the " + treasure.Name
	counter +=1
	counter_text.text = "Chests Opened: " + str(counter)
	if found_treasure.is_empty():
		found_treasure.append(treasure)
		checklist.append_text(treasure.Name + "\n")
	elif !found_treasure.is_empty():
		for i in range(found_treasure.size()):
			if found_treasure.has(treasure):
				pass
			elif !found_treasure.has(treasure):
				found_treasure.append(treasure)
				checklist.append_text(treasure.Name + "\n")
			
