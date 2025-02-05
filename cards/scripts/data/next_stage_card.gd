extends Resource

class_name NextStageCardData


@export_file("*.tscn") var card_scene_path: String
@export var card_data: CardData


var next_stage: String:
	get:
		return _construct_next_stage()


func _construct_next_stage():
	var template = "Metamorphosis: \n%s" 
	return template % card_data.title
