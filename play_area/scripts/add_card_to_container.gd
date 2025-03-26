extends Node

class_name AddCardToContainer
 
@export var group_name: CardsGroupNames.Types

@onready var parent_container: Container

func _ready() -> void:
	parent_container = get_parent()


func _init() -> void:
	var card_created : Signal = EventBus.get_signal_for_group( group_name)
	if card_created:
		card_created.connect(do)


func do(child: Node) -> void:
	var group_name_string = CardsGroupNames.get_string_for_group(group_name)
	if child.is_in_group(group_name_string):
		child.remove_from_group(group_name_string)
		parent_container.add_child.call_deferred(child)
