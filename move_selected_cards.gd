extends Node

signal done(card: Node)

@onready var salamander_container: HBoxContainer = %SalamanderContainer
@onready var cards_container: HBoxContainer = %CardsContainer
@onready var hand_container: HBoxContainer = %HandContainer


func _ready() -> void:
	var cards = get_tree().current_scene.find_children("*", "Selectable")
	cards.map(func(card): register_to_select_event(card))


func register_to_select_event(selectable: Selectable):
	selectable.selected.connect(triage_card_move_event)


func triage_card_move_event(card_node: Node, selected: bool):
	var card_parent = card_node.get_parent()
	if card_parent == hand_container:
		move_card(card_node)
	else:
		send_back_to_hand(card_node)
	done.emit(card_node)


func move_card(card_node: Node):
	if card_node.is_in_group(&"resources"):
		card_node.reparent(cards_container, false)
	if card_node.is_in_group(&"salamander"):
		if salamander_container.get_child_count() > 0:
			var card_to_move = salamander_container.get_child(0)
			card_to_move.reparent(hand_container, false)
		card_node.reparent(salamander_container, false)


func send_back_to_hand(card_node: Node):
	card_node.reparent(hand_container, false)
