extends Node

@onready var cards_container: HBoxContainer = $"../VBoxContainer/CardsContainer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cards_container.visible = false
