extends Node

@export var card_pack: Node
@export var card_row: CanvasItem


func do():
	card_pack.queue_free()
	card_row.visible = true
