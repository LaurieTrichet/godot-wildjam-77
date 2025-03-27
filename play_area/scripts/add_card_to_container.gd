extends Node

class_name AddCardToContainer
 
@export var card_group: CardSignal.Names

@onready var parent_container: Container

func _ready() -> void:
	parent_container = get_parent()
	var card_signal = CardSignal.get_card_signal( card_group)
	if card_signal and not card_signal.is_connected(do):
		card_signal.connect(do)


func do(child: Node) -> void:
	var group_name = CardSignal.as_string(card_group)
	if child.is_in_group(group_name):
		parent_container.add_child.call_deferred(child)
