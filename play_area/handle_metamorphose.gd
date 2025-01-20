extends Node

signal checked_validity(result: bool)
signal is_valid
signal is_invalid

@onready var cards_container: HBoxContainer = %"CardsContainer"
@onready var salamander_container: HBoxContainer = %SalamanderContainer


func check_recipe_valid():
	var result = false
	var cards = cards_container.get_children()
	
	if  !cards.is_empty() and salamander_container.get_child_count() > 0:
		result = check_recipe()
		
	checked_validity.emit(result)
	if result :
		is_valid.emit()
	else:
		is_invalid.emit()


func check_recipe() -> bool:
	var recipe_holders = salamander_container.get_child(0).find_children("*","RecipeHolder")
	if recipe_holders.size() == 0:
		return false

	var cards = cards_container.get_children()
	var recipe_data = recipe_holders[0].recipe.data
	var validity_map = {}
	
	for key in recipe_data:
		var amount_expected = recipe_data[key]
		var cards_in_group = cards.filter(func (card: Node): return card.is_in_group(key))
		validity_map[key] = cards_in_group.size() == amount_expected
	
	return validity_map.values().all(func (item): return item == true)


func do(_card: Node) -> void:
	check_recipe_valid()
