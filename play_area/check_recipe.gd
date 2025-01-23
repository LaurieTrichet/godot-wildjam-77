extends Node

class_name CheckRecipe

signal checked_validity(result: bool)
signal is_valid
signal is_invalid


func do(recipe: Recipe, cards: Array[Card]) -> void:
	var result = evalate_validity(recipe, cards)
		
	checked_validity.emit(result)
	if result :
		is_valid.emit()
	else:
		is_invalid.emit()


func evalate_validity(recipe: Recipe, cards: Array[Card]) -> bool:
	var recipe_data = recipe.data
	var validity_map = {}
	
	for key in recipe_data:
		var amount_expected = recipe_data[key]
		var cards_in_group = cards.filter(func (card: Card): return card.card_data.card_type.to_lower() == key)
		validity_map[key] = cards_in_group.size() == amount_expected
	
	return validity_map.values().all(func (item): return item == true)
