extends Control
var inv_source = inventory.inventory_slot
@onready var h_box_container: HBoxContainer = $HBoxContainer

func _ready() -> void:
	var id = 0
	for child in h_box_container.get_children():
		child.slot = id
		id += 1
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child in h_box_container.get_children():
		child.update_ui()
		
