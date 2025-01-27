extends SetCardProperty


func do(card_data: Resource):
	if !card_data:
		return
	var value = card_data.get(property_name)
	visible = value != null
	if value and get("texture"):
		set("texture",value)
