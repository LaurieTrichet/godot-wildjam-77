extends Control

class_name SetCardProperty

@export var property_name: String
@export var resource_holder: ResourceHolder

func _ready() -> void:
	if resource_holder:
		resource_holder.updated.connect(do)
	else:
		printerr("no resource attached for property: ", property_name)


func do(card_data: Resource)-> void:
	pass 
