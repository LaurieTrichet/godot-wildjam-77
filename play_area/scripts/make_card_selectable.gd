extends Node

class_name MakeCardSelectable

func do(card_node: Node):
	var selectable = card_node.find_child("Selectable")
	if selectable:
		selectable.disabled = false
