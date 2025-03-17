extends Node

class_name SetInteractionFilterTag

var dragging_layer: Control

func _ready() -> void:
	dragging_layer = get_tree().get_first_node_in_group(&"dragging_layer")


func do(is_on: bool):
	print("--- SetInteractionFilterTag: ", is_on)
	dragging_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE if is_on else Control.MOUSE_FILTER_STOP
