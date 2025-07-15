extends Area2D
class_name DroppedItem

var sprite

var drop_radius : float = 24.0
var drop_duration: float = 0.5
@export var jump_height: float = 20.0
@export var jump_duration: float = 0.2

func _ready() -> void:
	#$Sprite2D.frame = sprite
	drop()

func drop():
	var angle = randf() * TAU
	var distance = randf() * drop_radius
	var offset = Vector2.RIGHT.rotated(angle) * distance
	var target_position = global_position + offset

	var start_position = global_position
	var jump_position = global_position + Vector2(0, -jump_height)  # slight upward movement

	var tween = create_tween()

	# Jump up slightly
	tween.tween_property(self, "global_position", jump_position, jump_duration).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

	# Then drop to the final target position
	tween.tween_property(self, "global_position", target_position, drop_duration).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
