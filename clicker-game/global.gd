extends Node

var position
var enemy
var dmg_hit = 1

func get_pos(pos):
	position = pos

func get_enemy(e):
	enemy = e

func set_hit(hits):
	dmg_hit = hits
	
func get_hit():
	return dmg_hit
