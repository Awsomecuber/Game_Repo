extends Node

var Score: int = 0

var level: int = 0

func add_score():
	Score += 1
	print(str(Score))
	
	
func add_level() -> void:
	if Score%10 == 0:
		level+= 1
		print(str(level))
		
		
func reset() -> void:
	Score = 0
	level = 0
		
