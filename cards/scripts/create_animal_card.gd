extends Node

class_name CreateAnimalCard

signal card_created(card: Node)

func do(card_data: AnimalCardData):
	var prefab_path = card_data.card_scene_path
	var packed_scene = load(prefab_path) as PackedScene
	if packed_scene and packed_scene.can_instantiate():
		var prefab = packed_scene.instantiate()
		_attach_resource(prefab, card_data)
		card_created.emit(prefab)


func _attach_resource(card: Node, data: AnimalCardData):
	var resource_holder = card.find_child("CardDataHolder") as ResourceHolder
	resource_holder.resource = data
