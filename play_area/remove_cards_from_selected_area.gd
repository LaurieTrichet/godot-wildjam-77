extends Node

class_name RemoveCardsFromSelectedArea

@export var target_container: Container

func do(_node: Node):
	var children = target_container.find_children("*")
	var card_children = children.filter(func (child: Node): return child.is_in_group("card"))
	_remove_cards(card_children)


func _remove_cards(card_children: Array[Node]):
	for card in card_children:
		card.get_parent().remove_child(card)
		card.queue_free()
