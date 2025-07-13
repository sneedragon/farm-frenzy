extends Area2D
class_name Plant

@export var crop_name : String
var growth_stages : int # amount of growth stages this specific type of crop has
@export var max_lifetime : float

var growth_stage : int = 0 # current growth stag
var current_lifetime : float = 0 #growth so far
var time_per_stage : float #move onto next growth tier after passing this
var harvestable : bool = false # fully grown

var fruit
@export var harvest_yield : int = 1

var id : int

@export var is_growing : bool

func _ready():
	initialize_crop()
	
func _physics_process(delta: float) -> void:
	grow(delta)
	
func initialize_crop() -> void:
	growth_stages = $Sprite.sprite_frames.get_frame_count("default")
	time_per_stage = max_lifetime / float(growth_stages)
	print("Initialized " + self.name + " with " + str(growth_stages) + " divided to " + str(time_per_stage))
	
func grow(delta):
	growth_check(delta)

func growth_check(delta):
	if is_growing and current_lifetime < max_lifetime:
		current_lifetime += delta
		if current_lifetime > (time_per_stage * (float(growth_stage)+1.0)) and growth_stage < growth_stages:
			growth_stage += 1
			$Sprite.frame += 1
			if growth_stage == growth_stages:
				print(self.name + " grew to max: " + str(growth_stage))
				harvestable = true
			else:
				print(self.name + " grew to " + str(growth_stage))
	#TODO elif is_growing: die
	return
