extends Area2D

@export var unlocked : bool = false
var occupied : bool = false
@export var id : int

func _ready() -> void:
	id = global.assign_id()
