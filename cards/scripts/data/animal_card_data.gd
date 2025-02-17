extends Resource

class_name AnimalCardData


@export_file("*.tscn") var card_scene_path: String

@export var card_data: CoreCardData
@export var recipe: Recipe
@export var next_stage_data: AnimalCardData


var next_stage: String:
	get:
		return _construct_next_stage() if next_stage_data else ""


func _construct_next_stage():
	var template = "Metamorphosis: \n%s" 
	return template % next_stage_data.card_data.title
