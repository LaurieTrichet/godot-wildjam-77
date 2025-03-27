extends Node

class_name CardSignal

enum Names {
	card_created_from_recipe,
	booster_pack_open,
	created_card_taken
}

static func as_string (card_group: CardSignal.Names) -> StringName:
	return Names.find_key(card_group)


static func get_card_signal(card_group:  CardSignal.Names):
	var group_name = CardSignal.as_string(card_group)
	return EventBus.get_signal(group_name)


static func add_signal(card_group: CardSignal.Names):
	print ("Add_signal  ", card_group)
	var group_name = CardSignal.as_string(card_group)
	if (EventBus.signals.has(group_name)):
		return

	print ("Event Created ", group_name)
	return EventBus.set_signal(group_name)


static func emit_card_signal(card_group: CardSignal.Names, args: Array = []):
	var signal_name = as_string(card_group)
	EventBus.emit(signal_name, args)
