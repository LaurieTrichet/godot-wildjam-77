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
@export var image: Texture2D
@export var recipe: Recipe
var description: String:
	get:
		return recipe.description

var next_stage_description: String:
	get:
		return recipe.next_stage
