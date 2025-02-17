extends Node

class_name CreateAnimalCard

signal card_created(card: Node)

var animal_card_data: AnimalCardData


func do():
	if !animal_card_data:
		return
	var prefab_path = animal_card_data.card_scene_path
	var packed_scene = load(prefab_path) as PackedScene
	if packed_scene and packed_scene.can_instantiate():
		var prefab = packed_scene.instantiate()
		_attach_resource(prefab, animal_card_data)
		card_created.emit(prefab)


func _attach_resource(card: Node, data: AnimalCardData):
	var resource_holder = card.find_child("CardDataHolder") as ResourceHolder
	resource_holder.resource = data


func cache_data(data: AnimalCardData):
	animal_card_data = data


func clear_data():
	animal_card_data = null
