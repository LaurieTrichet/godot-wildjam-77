extends Node

@export var card_pack: Node
@onready var pack_container: HBoxContainer = %PackContainer
@onready var accept_cards_button: Button = %AcceptCardsButton


func _ready() -> void:
	pack_container.visible = false
	accept_cards_button.visible = false


func do():
	card_pack.visible = false
	pack_container.visible = true
	accept_cards_button.visible = true
