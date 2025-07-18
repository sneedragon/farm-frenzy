extends Node
class_name SeedList
const DEFAULT_MAX : int = 99

class SeedData:
	var display_name: String
	var sprites: SpriteFrames
	var grow_time: float
	var harvest_yield: int
	var health: float

	func _init(display_name, sprites, grow_time, harvest_yield, health):
		self.display_name = display_name
		self.sprites = sprites
		self.grow_time = grow_time
		self.harvest_yield = harvest_yield
		self.health = health

enum seeds {
	TOMATO,
	CUCUMBER
}

const SEED_DATA = {
	seeds.TOMATO: {
		"display_name": "Tomato",
		"icon": preload("res://sprites/icons/fruit/tomato.png"),
		"seed_icon": 'TODO',
		"sprites" : preload("res://scenes/plants/tomato_plant.tres"),
		"max": DEFAULT_MAX,
		"grow_time": 45.0,
		"harvest_yield": 2,
		"health": 100.0,
		"amount" : 1,
		"sell_value": 5,
		"item_type": null,
	},
	seeds.CUCUMBER: {
		"display_name": "Cucumber",
		"icon": preload("res://sprites/icons/fruit/cucumber.png"),
		"seed_icon": 'TODO',
		"sprites": preload("res://scenes/plants/cucumber_plant.tres"),
		"max": DEFAULT_MAX,
		"grow_time": 30.0,
		"harvest_yield": 4,
		"health": 200,
		"amount": 1,
		"sell_value": 1,
		"item_type": null,
	}
}

static func get_seed_data(seed_type : seeds) -> Dictionary:
	return SEED_DATA.get(seed_type, {})
