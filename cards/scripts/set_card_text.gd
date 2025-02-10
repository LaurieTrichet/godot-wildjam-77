extends SetCardProperty

class_name SetCardText

func _ready() -> void:
	super._ready()
	node_property_name = "text"


func _check_validity(value) -> bool:
	var result = false
	if value and value is String and !value.is_empty():
		result = true
	return result
