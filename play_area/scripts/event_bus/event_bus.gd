extends Node

var signals: Dictionary[StringName, Signal] = {}

func get_signal(signal_name: StringName):
	var result = signals.get(signal_name)
	return result


func set_signal(signal_name: StringName):
	var signal_to_add = Signal(self, signal_name)
	signals.set(signal_name, signal_to_add)
	if not has_signal(signal_name):
		add_user_signal(signal_name)
	return signals.get(signal_name)


func emit(signal_name: StringName, args: Array):
	var existing_signal = signals.get(signal_name)
	if existing_signal:
		print ("Emitting, ", signal_name)
		var params = [signal_name]
		params.append_array(args)
		emit_signal.callv(params)
