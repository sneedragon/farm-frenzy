extends StaticBody2D

func shovel_checks():
	pickup_shovel()

func pickup_shovel():
	#TODO hold sprite and stuff
	global.current_held = self
	print(str(global.current_held))
