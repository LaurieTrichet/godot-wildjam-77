extends Resource

class_name ResourceData

enum ResourceType{
	FOOD,
	TIME
}

@export var type: ResourceType
var card_type: String:
	get:
		var type_name: String = ResourceType.keys()[type]
		return type_name.capitalize()

@export var description: String
