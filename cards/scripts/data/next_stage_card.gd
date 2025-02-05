extends Resource

class_name NextStageCardData


@export_file("*.tscn") var card_scene_path: String
@export var card_data: CardData


var next_stage: String:
	get:
		return card_data.title
