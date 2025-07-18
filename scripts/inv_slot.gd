extends Panel
class_name InvSlot

@onready var inv_source = $"../..".inv_source

@export var slot : int


func update_ui():
	if inv_source[slot]:
		$ItemDisplay.texture = inv_source[slot]["icon"]
		$ItemAmountLabel.set_text(str(inv_source[slot]["amount"]))
		return
	$ItemDisplay.texture = null
	$ItemAmountLabel.set_text("")
	return
