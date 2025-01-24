extends Resource

class_name ResourceData

enum ResourceType{
	FOOD,
	TIME
}

@export var type: ResourceType
var card_type: String:
	get:
		return ResourceType.keys()[type]

@export var description: String
