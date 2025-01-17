extends Node

@onready var checkmark: Sprite2D = $"../Checkmark"

var checked: bool : 
	set(value):
		checkmark.visible = value
		checked = value


func _ready() -> void:
	checked = false

func toggle_selection():
	checked = !checked
