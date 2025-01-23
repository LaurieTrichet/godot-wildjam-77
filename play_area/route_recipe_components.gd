extends Node

signal available(recipe: Recipe, cards: Array[Card])

@onready var cards_container: HBoxContainer = %"CardsContainer"
@onready var salamander_container: HBoxContainer = %SalamanderContainer


func do() -> void:
	var cards = cards_container.get_children()
	
	if cards.is_empty() or salamander_container.get_child_count() == 0:
		return
	
	var card = cards[0] as Card
	if card.card_data and card.card_data.recipe:
		available.emit(card.card_data.recipe, cards)
	else:
		printerr("missing data in Card", card)
