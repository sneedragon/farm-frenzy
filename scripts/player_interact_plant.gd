extends Node
const PLANT = preload("res://scenes/plant.tscn")
func planting_checks(target):
	if global.current_seed:
		try_planting(target)
		return
	#TODO Harvest function
	print("There was nothing to do with " + str(target) + " ID: " + str(target.id))
	return
	
func try_planting(target_plot):
	if !target_plot.occupied:
		target_plot.occupied = true
		plant_a_seed(target_plot)
		global.current_seed = null
		return
	print(str(target_plot) + " is occupied already, could not plant seed.")

func plant_a_seed(target):
	var plant_instance = PLANT.instantiate()
	plant_instance.crop_type = global.current_seed["display_name"]
	
	plant_instance.is_growing = true #TODO DEBUG
	
	plant_instance.position = target.position
	plant_instance.id = target.id
	plant_instance.name = (global.current_seed["display_name"] + "Plant" + str(target.id))
	get_tree().root.add_child(plant_instance)
	print("Planted " + (str(plant_instance)) + " at " + str(target) + " ID: " + str(target.id))
	
	
