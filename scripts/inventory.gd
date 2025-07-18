extends Control

var inventory_size : int = 16
var inventory_slot : Array

func _ready() -> void:
	inventory_slot.resize(inventory_size)
	for i in range(inventory_size):
		inventory_slot[i] = null
		
func inv_check(original_item) -> bool:
	var item = original_item.duplicate(true)
	var slot_was_available = false
	try_to_stack(item) #regardless of function name, the IF part actually just checks if there are still items left to add.
	if item["amount"] > 0:
		for j in range(inventory_size):
			if !inventory_slot[j]:
				var new_item = item.duplicate(true)
				inventory_slot[j] = new_item
				inventory_slot[j]["amount"] = 1
				item["amount"] -= 1
				print (inventory_slot[j]["display_name"] + " picked up")
				slot_was_available = true
				break
		if not slot_was_available:
			return false
		if item["amount"] > 0:
			return inv_check(item)
	return true
		
func try_to_stack(item):
	for i in range(inventory_size):
		if inventory_slot[i] and inventory_slot[i]["display_name"] == item["display_name"]:
			add_to_stack(i, item)
			if item["amount"] <= 0:
				return
						
func add_to_stack(i, item):
	while inventory_slot[i]["amount"] < 99 and item["amount"] > 0:
		inventory_slot[i]["amount"] += 1
		item["amount"] -= 1
		print (inventory_slot[i]["display_name"] + " +" + str(inventory_slot[i]["amount"]))
	return
		
			
