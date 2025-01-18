extends Node

class_name Selectable

signal selected(card_node: Node, value: bool)

@onready var checkmark: Sprite2D = $"../Checkmark"
@onready var button: Button = $"../Button"

var disabled: bool:
	set(value):
		button.disabled = value
		button.visible = !value
		disabled = value


var checked: bool : 
	set(value):
		checkmark.visible = value
		checked = value


func _ready() -> void:
	checked = false
	disabled = true


func toggle_selection():
	checked = !checked
	selected.emit(get_parent(), checked)
