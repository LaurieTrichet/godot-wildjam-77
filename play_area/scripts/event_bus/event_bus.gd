extends Node

#todo change to dictionary
var signals: Array[Signal] = []


func get_signal(signal_name: StringName):
	print(EventBus.signals)
	var result = EventBus.signals.filter(func (a_signal: Signal): 
		return a_signal.get_name() == signal_name).front()
	print ("Get Signal = ", result)
	return result


func get_signal_for_group(signal_name: CardsGroupNames.Types):
	var event_name = CardsGroupNames.get_string_for_group(signal_name)
	return get_signal(event_name)


func add_signal(signal_name: CardsGroupNames.Types, target: Object):
	var event_name = CardsGroupNames.get_string_for_group(signal_name)
	var event = Signal(target, event_name)
	signals.push_back(event)
