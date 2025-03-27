extends Node

class_name TagCreatedCard

signal done

@export var group: CardSignal.Names


func _ready() -> void:
	CardSignal.add_signal(group)
	

func do( card: Node):
	var group_name = CardSignal.as_string(group)
	card.add_to_group(group_name)
	CardSignal.emit_card_signal(group, [card])
	done.emit()
