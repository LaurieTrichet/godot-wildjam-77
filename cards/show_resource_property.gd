extends Label

@export var property_name: String
@export var resource_holder: ResourceHolder

func _ready() -> void:
	if resource_holder:
		resource_holder.updated.connect(do)
	else:
		printerr("no resource attached for property: ", property_name)


func do(resource: Resource):
	visible = false
	var value = resource.get(property_name)
	print(property_name, value)
	if value and value is String:
		visible = ! value.is_empty()
		if value:
			text = value
	
