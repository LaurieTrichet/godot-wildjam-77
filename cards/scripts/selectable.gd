extends Node

class_name Selectable

signal selected(card_node: Node, value: bool)

@onready var button: Button = $"../Button"
@onready var selectable_icon: Node = %SelectableIcon

@export var disabled: bool:
	set(value):
		disabled = value
		await ready
		button.disabled = value
		button.visible = !value


@export var checked: bool = false : 
	set(value):
		selectable_icon.visible = value
		checked = value


func _ready() -> void:
	selectable_icon.visible = checked


func toggle_selection():
	checked = !checked
	selected.emit(get_parent(), checked)
