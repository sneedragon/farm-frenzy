extends StaticBody2D

var current_seed
#var seed_amount
#const MAX_AMOUNT: int = 99

func _ready() -> void:
	current_seed = seedlist.seeds.CUCUMBER
	


func set_player_seed():
	if current_seed:
		global.current_held = null
		global.current_seed = current_seed
		global.current_seed_data = seedlist.get_seed_data(current_seed)
		print("Seed set to " + str(current_seed))
