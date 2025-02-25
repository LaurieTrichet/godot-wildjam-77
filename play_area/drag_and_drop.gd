extends Node

class_name DragAndDrop

var target: Control
var acceptable_drop_groups: Array[String]

var is_dragging: bool = false
var dragging_layer: Node2D

func _ready() -> void:
	target = get_parent()
	dragging_layer = get_tree().current_scene.find_child("DraggingLayer")


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		
		# Start dragging if the click is on the sprite.
		if not is_dragging and event.pressed:
			is_dragging = true
			_move_to_dragging_layer()
			
		# Stop dragging if the button is released.
		if is_dragging and not event.pressed:
			is_dragging = false
			_move_from_dragging_layer()

	if event is InputEventMouseMotion and is_dragging:
		# While dragging, move the sprite with the mouse.
		target.position = event.position


func _move_to_dragging_layer():
	target.reparent(dragging_layer)

func _move_from_dragging_layer():
	pass
