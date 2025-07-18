extends Node
var current_held = null
var current_seed = null
var current_seed_data : Dictionary
var id : int = 0

var cash : int = 0

func assign_id() -> int:
	id += 1
	return id
	
