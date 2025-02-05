extends Control

class_name SetCardProperty

@export var property_name: String
@export var node_property_name: String
@export var resource_holder: ResourceHolder

func _ready() -> void:
	if resource_holder:
		resource_holder.updated.connect(do)
	else:
		printerr("no resource attached for property: ", property_name)


func do(resource: Resource)-> void:
	visible = false
	if !property_name or !resource:
		return
	var value = resource.get(property_name)
	print("SetCardProperty ",node_property_name, property_name , value)
	if value and value is String:
		visible = ! value.is_empty()
		if value and get(node_property_name):
			set(node_property_name, value)
