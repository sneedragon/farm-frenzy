extends Node

const GROW_PLOT = preload("res://scenes/grow_plot.tscn")

func place_plot(target):
	if is_in_field(target) and !is_plot_already(target):
		var plot_instance = GROW_PLOT.instantiate()
		plot_instance.global_position = target
		plot_instance.id = global.assign_id()
		get_tree().root.add_child(plot_instance)
		print("Dug Plot " + str(plot_instance.id) + " at " + str(target))

func is_in_field(target) -> bool:
	if target.x > 72 and target.x < 312 and target.y > 72 and target.y < 200:
		return true
	print(str(target) + " is not in the planting zone.")
	return false

func is_plot_already(target) -> bool:
	var space_state = get_viewport().get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = target
	query.collide_with_areas = true
	query.collide_with_bodies = false
	
	var results = space_state.intersect_point(query, 16)

	for result in results:
		var collider = result["collider"]
		if collider.is_in_group("Plot"):
			print("Could not dig Plot at " + str(target) + ", a Plot already exists")
			return true
	return false
