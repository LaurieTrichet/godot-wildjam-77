extends Node

class_name AddCardToContainer
 
@export var group_name: StringName

@onready var parent_container: Container

func _ready() -> void:
	parent_container = get_parent()

# Called when the node enters the scene tree for the first time.
func do(child: Node) -> void:
	if child.is_in_group(group_name):
		child.remove_from_group(group_name)
		parent_container.add_child.call_deferred(child)
