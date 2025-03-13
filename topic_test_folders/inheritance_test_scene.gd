extends Node2D

@export var input_resources: Array[Recipe]

func _ready() -> void:
	var results = find_children(&"*", &"Animal")
	print(results)
