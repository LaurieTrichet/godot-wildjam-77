extends Node

@export var card_pack: Node
@onready var hand_container: HBoxContainer = %HandContainer


func do():
	card_pack.queue_free()
	hand_container.visible = true
