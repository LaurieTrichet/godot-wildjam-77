extends Resource

class_name ResourceCardData

enum ResourceType{
	FOOD,
	TIME
}

@export_file("*.tscn") var card_scene_path: String

@export var card_data: CoreCardData
@export var type: ResourceType
var card_type: String:
	get:
		var type_name: String = ResourceType.keys()[type]
		return type_name.capitalize()

@export var description: String
