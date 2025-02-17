extends Node

signal recipe_component_available(recipe: Recipe, resource_data_list: Array[ResourceData])
signal recipe_output_available(result_card_data: AnimalCardData)
signal invalid

@onready var input_recipe_cards_container: HBoxContainer = %InputRecipeCardsContainer
@onready var target_card_container: HBoxContainer = %TargetCardContainer


func do() -> void:
	var cards = input_recipe_cards_container.get_children()
	
	if cards.is_empty() or target_card_container.get_child_count() == 0:
		invalid.emit()
		return
	
	var card_resource: AnimalCardData = _get_target_card_resource()
	if ! card_resource or card_resource is not AnimalCardData:
		printerr("resource is not of type Animal Card Data ", target_card_container.get_children())
		invalid.emit()
		return
	
	var recipe: Recipe = _get_recipe(card_resource)
	if !recipe:
		printerr("missing resource in recipe holder for Card: ", target_card_container.get_children())
		invalid.emit()
		return

	var resource_data_list : Array[ResourceData] = _get_resources(cards)
	recipe_component_available.emit(recipe, resource_data_list)
	recipe_output_available.emit(card_resource.next_stage_data)


func _get_target_card_resource():
	var target_card_node =  target_card_container.get_children().front()
	var card_data_holder: ResourceHolder = target_card_node.find_child("CardDataHolder")
	if !card_data_holder:
		printerr("missing node named RecipeResourceHolder in Card: ", target_card_node.name)
		return

	if !card_data_holder.resource:
		return
		
	return card_data_holder.resource


func _get_recipe(resource: Resource):
	var target_card_node =  target_card_container.get_children().front()
	var card_data_holder: ResourceHolder = target_card_node.find_child("CardDataHolder")
	if !card_data_holder:
		printerr("missing node named RecipeResourceHolder in Card: ", target_card_node.name)
		return

	if !card_data_holder.resource or (!card_data_holder.resource.get("recipe")):
		printerr("missing Recipe resource in recipe holder for Card: ",target_card_node.name)
		return
		
	return card_data_holder.resource.recipe


func _get_resources(cards: Array[Node]) -> Array[ResourceData]:
	var results: Array[ResourceData] = []
	for card in cards:
		var resource_data := _get_resource_data_for_node(card)
		if resource_data:
			results.append(resource_data)
		else:
			printerr("resource data is null")
	return results


func _get_resource_data_for_node(card: Node) -> ResourceData:
	var resource_holder = card.find_child("CardDataHolder") as ResourceHolder
	if !resource_holder.resource or (!resource_holder.resource is ResourceData):
		printerr("missing ResourceData resource for Card: ",card.name)
		return
	
	return resource_holder.resource as ResourceData
