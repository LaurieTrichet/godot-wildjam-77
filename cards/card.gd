extends Node

class_name Card

signal updated(card_data: CardData)

@export var card_data: CardData:
	set(value):
		card_data = value


func _ready() -> void:
	updated.emit(card_data)
