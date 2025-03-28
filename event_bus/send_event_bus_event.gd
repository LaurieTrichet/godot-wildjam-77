extends Node

class_name SendEventBusEvent

@export var card_signal: CardSignal.Names

func _ready() -> void:
	CardSignal.add_signal(card_signal)


func do():
	CardSignal.emit_card_signal(card_signal)
