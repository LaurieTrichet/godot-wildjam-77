extends Node

class_name TagCreatedCard

signal done

@export var group_name: CardsGroupNames.Types

func _init() -> void:
	var event_name = CardsGroupNames.get_string_for_group(group_name)
	var created_card_signal = Signal(self, event_name)
	EventBus.signals.push_back(created_card_signal)


func do( card: Node):
	var event_name = CardsGroupNames.get_string_for_group(group_name)
	card.add_to_group(event_name)
	var event: Signal = EventBus.get_signal(event_name)
	if event:
		event.emit(card)
	done.emit()
