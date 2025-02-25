extends Node

class_name PlayAnimationMoveContainer

signal done()

var acceptable_drop_groups: Array[String]

var is_dragging: bool = false
var dragging_layer: Control

func _ready() -> void:
	dragging_layer = get_tree().current_scene.find_child("DraggingLayer")


func do(target_node: Node, from_container:Control, to_container: Control):
	target_node.reparent(dragging_layer)
	var global_target_position = to_container.get_global_transform().origin
	var dragging_target_position = dragging_layer.get_transform().
	var tween = create_tween().bind_node(target_node)
	tween.tween_property(target_node, "position", dragging_target_position, 1.0)
	tween.tween_callback(func(): target_node.reparent(to_container))
