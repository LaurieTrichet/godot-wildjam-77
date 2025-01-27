extends SetCardProperty

func do(resource: Resource):
	visible = false
	if !property_name or !resource:
		return
	var value = resource.get(property_name)
	print(property_name, value)
	if value and value is String:
		visible = ! value.is_empty()
		if value and get("text"):
			set("text", value)
