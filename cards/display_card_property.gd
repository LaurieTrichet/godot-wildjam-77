extends Label

@export var property_name: String

var card: Card

func _ready() -> void:
	card = find_parent("Card")
	if card:
		card.updated.connect(do)


func do(card_data: CardData):
	var value = card_data.get(property_name)
	print(property_name, value)
	if (value is String):
		visible = ! value.is_empty()
		if value:
			text = value
	
