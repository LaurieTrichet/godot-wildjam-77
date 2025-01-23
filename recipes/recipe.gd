extends Resource

class_name Recipe

@export var data: Dictionary = {}
@export_file("*.tscn") var card_scene_path: String
@export var card_data: CardData

var description: String:
	get:
		return construct_desccription()


var next_stage: String:
	get:
		return card_data.title
	

func construct_desccription() -> String:
	print ("-ENTER- construct_desccription")
	var items = []
	for key in data:
		var value = data[key]
		items.append( " %s %s"%[value, key])
	var result = ", ".join(items)
	print ("result: ",result)
	return result
