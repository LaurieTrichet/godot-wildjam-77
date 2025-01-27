extends Node

class_name CheckRecipeValidity

signal checked_validity(result: bool)
signal is_valid
signal is_invalid


func do(recipe: Recipe, resource_data_list: Array[ResourceData]) -> void:
	var result = evaluate_validity(recipe, resource_data_list)
		
	checked_validity.emit(result)
	if result :
		is_valid.emit()
	else:
		is_invalid.emit()


func evaluate_validity(recipe: Recipe, resource_data_list: Array[ResourceData]) -> bool:
	var recipe_data = recipe.data
	var validity_map = {}
	
	for key in recipe_data:
		var amount_expected = recipe_data[key]
		var cards_in_group = resource_data_list.filter(func (resource_data: ResourceData): return resource_data.card_type.to_lower() == key)
		validity_map[key] = cards_in_group.size() == amount_expected
	
	return validity_map.values().all(func (item): return item == true)
