extends Node


func harvest(target):
	target.drop_fruit()
	print("Harvested " + str(target))
	return

func harvest_plot(target):
	target.currently_planted.drop_fruit()
	print("Harvested " + str(target.currently_planted))
	return
