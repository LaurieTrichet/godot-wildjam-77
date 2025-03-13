extends Node

class_name CreateResourceCard

signal card_created(card: Node)

var card_data: ResourceCardData


func do():
	if !card_data:
		return
	var prefab_path = card_data.card_scene_path
	var packed_scene = load(prefab_path) as PackedScene
	if packed_scene and packed_scene.can_instantiate():
		var prefab = packed_scene.instantiate()
		_attach_resource(prefab, card_data)
		card_created.emit(prefab)


func _attach_resource(card: Node, data: ResourceCardData):
	var resource_holder = card.find_child("CardDataHolder") as ResourceHolder
	resource_holder.resource = data


func cache_data(data: ResourceCardData):
	card_data = data


func clear_data():
	card_data = null
