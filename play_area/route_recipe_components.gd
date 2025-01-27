extends Node

signal available(recipe: Recipe, cards: Array[ResourceData])

@onready var input_recipe_cards_container: HBoxContainer = %InputRecipeCardsContainer
@onready var target_card_container: HBoxContainer = %TargetCardContainer


func do() -> void:
	var cards = input_recipe_cards_container.get_children()
	
	if cards.is_empty() or target_card_container.get_child_count() == 0:
		return
	
	var card_node =  target_card_container.get_children().front()
	var recipe_resource_holder: ResourceHolder = card_node.find_child("RecipeResourceHolder")
	if !recipe_resource_holder:
		printerr("missing node named RecipeResourceHolder in Card: ", card_node.name)
		return

	var recipe = recipe_resource_holder.resource
	if !recipe:
		printerr("missing resource in recipe holder for Card: ",card_node.name)
		return

	var resource_data_list = cards.map(func (card: Node): return card.find_child("ResourceHolder").resource)
	available.emit(recipe, resource_data_list)
