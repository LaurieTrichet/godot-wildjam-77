extends Node

class_name PlayAnimationSwapCardsInContainer

signal animation_started()
signal reset_of_hand_done( replacing_node: Node, from_container:Control, to_container: Control)

@export var duration: float = 1.0

var acceptable_drop_groups: Array[String]

var dragging_layer: Control

func _ready() -> void:
	dragging_layer = get_tree().current_scene.find_child("DraggingLayer")


func do(replaced_node: Node, replacing_node: Node, from_container:Control, to_container: Control):
	animation_started.emit()
	replaced_node.reparent(dragging_layer)
	var global_target_position = from_container.get_screen_position()
	var dragging_target_position = dragging_layer.make_canvas_position_local(global_target_position)
	var tween = create_tween().bind_node(replaced_node)
	tween.tween_property(replaced_node, "position", dragging_target_position, duration)
	tween.tween_callback(on_end_swap_animation.bind(replaced_node, replacing_node, from_container, to_container) )


func on_end_swap_animation(replaced_node: Node, replacing_node: Node, from_container:Control, to_container: Control):
	replaced_node.reparent(from_container)
	reset_of_hand_done.emit(replacing_node, from_container, to_container)
