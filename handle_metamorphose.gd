extends Node

@onready var cards_container: HBoxContainer = %"CardsContainer"
@onready var feed_button: Button = $"../FeedButton"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var cards = cards_container.get_children()
	var food_count = 0
	var egg_count = 0
	for card in cards:
		if card.is_in_group(&"food"):
			food_count += 1
		elif card.is_in_group(&"egg"):
			egg_count += 1
	if food_count == 1 && egg_count == 1:
		feed_button.disabled = false
