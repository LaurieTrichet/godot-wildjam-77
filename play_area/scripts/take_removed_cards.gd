extends Node

class_name TakeRemovedCards
 
@export var group_names: Array[CardsGroupNames.Types]

@onready var hand_container: Container

func _ready() -> void:
	hand_container = get_parent()
	get_tree().node_removed.connect(do)


func do(child: Node) -> void:
	var group_to_remove = find_group(child)
	if group_to_remove:
		child.remove_from_group(group_to_remove)
		hand_container.add_child.call_deferred(child)


func find_group(child: Node):
	var groupe_names_string = group_names.map(func (group_name): return CardsGroupNames.get_string_for_group(group_name))
	var found =  groupe_names_string.filter(func (group_name):
		return child.is_in_group(group_name)).front()
	return found
	
