extends Node

class_name CreateCard

signal card_created(card_data)

func do(card_data: Resource):
	var prefab_path = card_data.card_scene_path
	var packed_scene = load(prefab_path) as PackedScene
	if packed_scene and packed_scene.can_instantiate():
		var prefab = packed_scene.instantiate()
