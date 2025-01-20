extends Resource

class_name CardData

enum CardType{
	SALAMANDER,
	FOOD,
	TIME
}

@export var type: CardType
var card_type: String:
	get:
		return CardType.keys()[type]
@export var title: String
@export var description: String
@export var next_stage_description: String
@export var image: Texture2D
