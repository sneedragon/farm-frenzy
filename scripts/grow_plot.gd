extends Area2D
class_name GrowPlot

@export var unlocked : bool = false
var occupied : bool = false
@export var id : int
var currently_planted : Plant

func _ready() -> void:
	id = global.assign_id()
