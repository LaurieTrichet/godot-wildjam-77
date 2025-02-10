extends SetCardProperty

class_name SetCardImage


func _ready() -> void:
	super._ready()
	node_property_name = "texture"


func _check_validity(value) -> bool:
	var result = false
	if value and value is Texture2D:
		result = true
	return result
