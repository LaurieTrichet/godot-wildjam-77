extends Node

class_name Selectable

signal selected(card_node: Node, value: bool)

@onready var button: Button = $"../Button"
@onready var selectable_icon: Node = %SelectableIcon

var disabled: bool:
	set(value):
		button.disabled = value
		button.visible = !value
		disabled = value


var checked: bool : 
	set(value):
		selectable_icon.visible = value
		checked = value


func _ready() -> void:
	checked = false
	disabled = true


func toggle_selection():
	checked = !checked
	selected.emit(get_parent(), checked)
