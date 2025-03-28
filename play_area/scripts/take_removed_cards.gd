extends Node

class_name TakeRemovedCards
 
@export var groups: Array[CardSignal.Names]

@onready var hand_container: Container

func _ready() -> void:
	hand_container = get_parent()
	print("take removed card ready")
	get_tree().node_removed.connect(do)


func do(child: Node) -> void:
	print("take removed card", child)
	if not child.is_in_group(&"card"):
		return
	var group_to_remove = find_group(child)
	if group_to_remove:
		child.remove_from_group(group_to_remove)
		hand_container.add_child.call_deferred(child)


func find_group(child: Node):
	var group_names = groups.map(func (group): return CardSignal.as_string(group))
	
	var found_items = group_names.filter(func (group_name):
		return child.is_in_group(group_name))
	if found_items.is_empty():
		return false
	return found_items.front()
	
