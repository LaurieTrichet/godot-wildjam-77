extends Node

class_name SendEventBusEvent

@export var event: CardsGroupNames.Types


func _init() -> void:
	var event_name = CardsGroupNames.get_string_for_group(event)
	EventBus.signals.push_back(Signal(self, event_name))


func do():
	var event_name = CardsGroupNames.get_string_for_group(event)
	var event = EventBus.get_signal(event_name)
	event.emit()
