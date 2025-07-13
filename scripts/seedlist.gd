extends Node
class_name SeedList
const DEFAULT_MAX : int = 99

enum seeds {
	TOMATO,
	CUCUMBER
}

const SEED_DATA = {
	seeds.TOMATO: {
		"scene": preload("res://scenes/plants/tomato_plant.tscn"),
		"icon": 'TODO',
		"max": DEFAULT_MAX,
		"display_name": "Tomato Seed"
	},
	seeds.CUCUMBER: {
		"scene": preload("res://scenes/plants/cucumber_plant.tscn"),
		"icon": 'TODO',
		"max": DEFAULT_MAX,
		"display_name": "Cucumber Seed"
	}
}

static func get_seed_data(seed_type : seeds) -> Dictionary:
	return SEED_DATA.get(seed_type, {})
