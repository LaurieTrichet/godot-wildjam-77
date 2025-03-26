extends Node

class_name RemoveCardsFromParent

signal done


# Called when the node enters the scene tree for the first time.
func do() -> void:
	get_parent().get_children().map(func (child: Node): get_parent().remove_child(child))
	done.emit()
