extends Node

class_name RemoveCardsFromParent

signal done


func do() -> void:
	get_parent().get_children().filter(is_card).map(_remove_from_tree )
	done.emit()


func is_card(child: Node):
	return child.is_in_group(&"card")


func _remove_from_tree(child: Node):
	get_parent().remove_child(child)
