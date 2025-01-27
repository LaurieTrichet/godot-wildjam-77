extends Node

class_name Selectable

signal selected(card_node: Node, value: bool)

@export var disabled_on_start: bool = true

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
	disabled = disabled_on_start


func toggle_selection():
	print("-> enter toggle_selection")
	checked = !checked
	selected.emit(get_parent(), checked)
