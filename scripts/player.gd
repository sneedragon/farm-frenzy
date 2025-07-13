extends CharacterBody2D

@onready var planting: Node = $Interactions/Planting
@onready var shoveling: Node = $Interactions/Shoveling


const SPEED = 150.0

func _process(delta: float) -> void:
	#TODO Show held item 
	pass
	
func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	var direction := Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	if direction:
		$Raycast.rotation = direction.angle()
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		interact()

func interact():
	var held_item = global.current_held
	var target = raycast()
	if target:
		
		#PLANTING
		if target.name == "SeedBox":
			print("test!")
			target.set_seed()
			return
		if target.is_in_group("Plot"):
			planting.planting_checks(target)
			return
			
		#PLANTCARE & HARVESTING
		if target.is_in_group("Plant"):
			pass
			return
			
		#BUY AND PLACE NEW GROWTH PLOTS
		if target.name == "Shovel":
			target.shovel_checks()
			return
			
	if held_item:
		if held_item.name == "Shovel":
			shoveling.place_plot(global_position)
			return
		#push_error("Player interacted with unidentified collider: " + str(target))
	print("There is no target to interact with.")


	
func raycast():
	if $Raycast.is_colliding():
			print(str($Raycast.get_collider()))
			return $Raycast.get_collider()
	return
