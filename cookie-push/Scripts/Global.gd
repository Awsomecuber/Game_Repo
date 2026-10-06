extends Node

var lvl = 1
var result: bool = false
#true is won, false is lose
var completed_levels: Dictionary[String, bool] = {
	"1": true, "2": false, "3": false, "4": false,
	"5": false, "6": false, "7": false, "8": false,
	"9": false, "10": false, "11": false, "12": false,
	"13": false, "14": false, "15": false, "16": false,
	"17": false, "18": false, "19": false, "20": false
}
		
func completed(completed_lvl: int):
	if completed_lvl == lvl:
		lvl += 1
