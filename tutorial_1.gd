extends Node


@onready var hand_container: HBoxContainer = %HandContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hand_container.visible = false
