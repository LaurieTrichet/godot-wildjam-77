extends Node

class_name MoveChildrenToContainer

@export var from_container: Node
@export var to_container: Node 
 
# Called when the node enters the scene tree for the first time.
func do() -> void:
	var cards = from_container.get_children()
	cards.map(func (card:Node): card.reparent(to_container))
