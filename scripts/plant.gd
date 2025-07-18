extends Area2D
class_name Plant

var dropped_item = preload("res://scenes/dropped_item.tscn")

@export var crop_type : seedlist.seeds #export for testing purposes. is actually set when instantiating in player_interact_planting.gd.
var crop_data

#@onready var crop_name : String
var health: float
var growth_stages : int # amount of growth stages this specific type of crop has
var needed_growth_time : float
var max_lifetime : float
var harvest_yield : int

var growth_stage : int = 0 # current growth stag
var current_lifetime : float = 0 #growth so far
var plot : GrowPlot

var time_per_stage : float #move onto next growth tier after passing this
var harvestable : bool = false # fully grown



var id : int

@export var is_growing : bool

func _ready():
	initialize_crop()
	
func _physics_process(delta: float) -> void:
	grow(delta)
	
func initialize_crop() -> void:
	crop_data = seedlist.get_seed_data(crop_type)
	health = crop_data["health"]
	needed_growth_time = crop_data["grow_time"]
	harvest_yield = crop_data["harvest_yield"]
	$Sprite.frames = crop_data["sprites"]
	growth_stages = $Sprite.sprite_frames.get_frame_count("default")
	time_per_stage = needed_growth_time / float(growth_stages)
	max_lifetime = (needed_growth_time + (time_per_stage * 2))
	plot.currently_planted = self
	print("Initialized " + self.name + " with " + str(growth_stages) + " divided to " + str(time_per_stage))
	
func grow(delta):
	growth_check(delta)

func growth_check(delta):
	if is_growing:
		current_lifetime += delta
		if current_lifetime < needed_growth_time:
			if current_lifetime > (time_per_stage * (float(growth_stage)+1.0)) and growth_stage < (growth_stages - 1):
				growth_stage += 1
				$Sprite.frame = growth_stage
				if growth_stage == growth_stages -1:
					print(self.name + " grew to max: " + str(growth_stage))
					harvestable = true
				else:
					print(self.name + " grew to " + str(growth_stage))
			return
		#TODO Make HP Based
		if current_lifetime >= max_lifetime - time_per_stage:
			modulate = Color(0.6, 0.4, 0.2)
			if current_lifetime >= max_lifetime:
				die()
	return

func drop_fruit():
	if harvestable == true:
		for i in range(crop_data["harvest_yield"]):
			var fruit_instance = dropped_item.instantiate()
			var fruit_data = crop_data.duplicate(true)
			fruit_instance.item_data = fruit_data
			fruit_instance.item_data["item_type"] = "Fruit"
			fruit_instance.global_position = global_position
			get_tree().root.add_child(fruit_instance)
			print("Dropped " + (str(fruit_instance)) + " at " + str(global_position))
		#TODO what if some plants could stay alive after harvesting?
		die()
	print(self.name + " is not harvestable!")
	return

func die():
	plot.currently_planted = null
	plot.occupied = false
	queue_free()
