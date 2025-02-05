extends Resource

class_name Recipe

@export var data: Dictionary = {}

var description: String:
	get:
		return construct_description()
	

func construct_description() -> String:
	print ("-ENTER- construct_description")
	var items = []
	for key in data:
		var value = data[key]
		items.append( " %s %s"%[value, key])
	var result = ", ".join(items)
	print ("result: ",result)
	return result
