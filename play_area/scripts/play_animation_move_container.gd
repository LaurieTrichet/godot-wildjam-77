extends Node

class_name PlayAnimationMoveContainer

signal animation_started()
signal done()

@export var duration: float = 1.0

var dragging_layer: Control

func _ready() -> void:
	dragging_layer = get_tree().current_scene.find_child("DraggingLayer")


func do(target_node: Node, from_container:Control, to_container: Control):
	animation_started.emit()
	target_node.reparent(dragging_layer)
	var global_target_position = to_container.get_screen_position()
	var dragging_target_position = dragging_layer.make_canvas_position_local(global_target_position)
	var tween = create_tween().bind_node(target_node)
	tween.tween_property(target_node, "position", dragging_target_position, duration)
	tween.tween_callback(func(): on_end_animation(target_node,to_container))


func on_end_animation(target_node: Node, to_container: Control):
	target_node.reparent(to_container)
	done.emit()
