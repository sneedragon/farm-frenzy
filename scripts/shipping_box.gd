extends StaticBody2D
class_name  ShippingBox

func sell_all_fruit():
	for i in range(inventory.inventory_size):
		if inventory.inventory_slot[i] and inventory.inventory_slot[i]["item_type"] == "Fruit":
			global.cash += inventory.inventory_slot[i]["amount"] * inventory.inventory_slot[i]["sell_value"]
			print("Sold " + inventory.inventory_slot[i]["display_name"] + "x" + str(inventory.inventory_slot[i]["amount"]))
			inventory.inventory_slot[i] = null
			print(str(global.cash))
	return
