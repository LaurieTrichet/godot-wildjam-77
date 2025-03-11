extends Node

class_name ToggleInteractionFilter

@export var are_interactions_allowed: bool = false

var dragging_layer: Control

func _ready() -> void:
	dragging_layer = get_tree().current_scene.find_child("DraggingLayer")


func do():
	are_interactions_allowed = !are_interactions_allowed
	print("--- toggle interativity: ", are_interactions_allowed)
	dragging_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE if are_interactions_allowed else Control.MOUSE_FILTER_STOP
