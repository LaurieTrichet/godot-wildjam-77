extends Node

class_name TakeRemovedCards
 
@export var group_name: StringName

@onready var hand_container: Container

func _ready() -> void:
	hand_container = get_tree().current_scene.find_child("HandContainer")
	get_tree().node_removed.connect(do)
	print(" take remove cards: ", get_tree().current_scene)

# Called when the node enters the scene tree for the first time.
func do(child: Node) -> void:
	if child.is_in_group(group_name):
		child.remove_from_group(group_name)
		hand_container.add_child.call_deferred(child)
