extends Node

class_name RemoveCardsFromSelectedArea

signal done()

@export var target_container: Container

func do(_node: Node):
	var children = get_tree().get_nodes_in_group("card")
	var card_children = children.filter( func (child: Node): return _is_selected(child))
	_remove_cards(card_children)
	done.emit()


func _is_selected(child: Node):
	var selectable = child.find_child("Selectable") as Selectable
	return selectable.checked and not selectable.disabled
	

func _remove_cards(card_children: Array[Node]):
	for card in card_children:
		card.get_parent().remove_child(card)
		card.queue_free()
