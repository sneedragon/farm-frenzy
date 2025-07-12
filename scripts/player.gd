extends CharacterBody2D


const SPEED = 150.0

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	var direction := Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		interact()

func interact():
	var target = raycast()
	
	#PLANTING
	if target.is_in_group("Plot"):
		if global.current_seed:
			plant(target)
			return
		#TODO Harvest function
		print("There was nothing to do with " + str(target))
			
	elif !target:
		print("Nothing in front of character")
		return
	push_error("Player interacted with unidentified collider: " + str(target))
	

func plant(target_plot):
	var current_seed = global.current_seed
	if !target_plot.occupied:
		target_plot.occupied = true
		plant_a_seed(current_seed, target_plot)
		print(str(current_seed) + " planted in " + str(target_plot) + " at " + str(target_plot.position))
		global.current_seed = null
		return
	print(str(target_plot) + " is occupied already, could not plant seed.")

	
func raycast():
	if $Raycast.is_colliding():
			print(str($Raycast.get_collider()))
			return $Raycast.get_collider()
	return

func plant_a_seed(seed, target):
	return
	var plant_instance = seed.instantiate()
	plant_instance.position = target.position
	get_tree().root.add_child(plant_instance)
	
