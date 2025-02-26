extends Node


class_name MoveCanvasItem

@export var target_container: Container
@export var drag_layer: Control
@export var canvas_item_to_move: CanvasItem
@export var origin_container: Container

func do():
	print("do")
	var target_container_global_position = target_container.get_screen_position()
	print ("origin", target_container_global_position)
	print ("drag layer ", drag_layer.get_global_transform_with_canvas())
	var target_position_in_drag_layer = drag_layer.make_canvas_position_local(target_container_global_position)
	canvas_item_to_move.reparent(drag_layer)
	
	print ("parent ", canvas_item_to_move.get_parent())
	var tween = get_tree().create_tween().bind_node(canvas_item_to_move)
	tween.tween_property(canvas_item_to_move, "position", target_position_in_drag_layer, 1.0)
	tween.tween_callback(func (): canvas_item_to_move.reparent(target_container))

func reset():
	canvas_item_to_move.reparent(origin_container)
