extends Resource

class_name CardCreationData


@export_file("*.tscn") var card_scene_path: String

@export var card_data: CardData
@export var recipe: Recipe
@export var next_stage_data: CardCreationData


var next_stage: String:
	get:
		return _construct_next_stage()


func _construct_next_stage():
	var template = "Metamorphosis: \n%s" 
	return template % card_data.title
