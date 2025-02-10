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
	var value = _get_property(resource, property_name)
	print("SetCardProperty %s, %s "%[node_property_name, property_name] , value)
	if _check_validity(value):
		visible = true
		print("set %s "%[node_property_name] , value)
		set(node_property_name, value)
	else:
		visible = false


func _check_validity(value) -> bool:
	return false


func _get_property(resource: Resource, property_path: String):
	var property_names = property_path.split(".")
	var target_property = resource
	for property_name in property_names:
		target_property = target_property.get(property_name)
		if !target_property:
			printerr("no property for ", property_name, property_path )
			return
	return target_property
