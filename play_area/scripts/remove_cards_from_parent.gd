extends Node

class_name RemoveCardsFromParent

signal done


func do() -> void:
	print("remove from parent ", get_parent().get_name())
	get_parent().get_children().filter(
		func (child: Node): return child.is_in_group(&"card")).map(
			func (child: Node): get_parent().remove_child(child))
	done.emit()
