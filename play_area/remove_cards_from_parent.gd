extends Node

class_name RemoveCardsFromParent
 
@export var group_name: StringName

# Called when the node enters the scene tree for the first time.
func do() -> void:
	var cards = get_tree().get_nodes_in_group(group_name)
	print ("RemoveCardsFromParent: ", cards)
	cards.map(func (card:Node): card.get_parent().remove_child(card))
