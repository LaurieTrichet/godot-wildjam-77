extends Node

class_name ResourceHolder

signal updated(resource: Resource)

@export var resource: Resource:
	set(value):
		resource = value
		updated.emit(resource)


func _ready() -> void:
	updated.emit(resource)
