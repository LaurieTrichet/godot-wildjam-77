extends SetCardProperty

class_name SetCardImage


func _ready() -> void:
	super._ready()
	node_property_name = "texture"


func do(card_data: Resource):
	if !card_data:
		return
	var value = card_data.get(property_name)
	visible = value != null
	if value and get(node_property_name):
		set(node_property_name,value)
