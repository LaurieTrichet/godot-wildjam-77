extends SetCardProperty

class_name SetCardText

func _ready() -> void:
	super._ready()
	node_property_name = "text"


func do(resource: Resource):
	visible = false
	if !property_name or !resource:
		return
	var value = resource.get(property_name)
	print(property_name, value)
	if value and value is String:
		visible = ! value.is_empty()
		if value and get(node_property_name):
			set(node_property_name, value)
