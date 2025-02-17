extends Node

signal done(card: Node)

@onready var target_card_container: HBoxContainer = %TargetCardContainer
@onready var input_cards_container: HBoxContainer = %InputRecipeCardsContainer
@onready var hand_container: HBoxContainer = %HandContainer


func _ready() -> void:
	var cards = get_tree().current_scene.find_children("*", "Selectable")
	cards.map(func(card): register_to_select_event(card))


func connect_to_selectable_if_possible(child: Node):
	var selectable = child.find_children("*", "Selectable").front()
	if selectable:
		register_to_select_event(selectable)


func register_to_select_event(selectable: Selectable):
	selectable.selected.connect(triage_card_move_event)


func triage_card_move_event(card_node: Node, selected: bool):
	var card_parent = card_node.get_parent()
	if card_parent == hand_container:
		move_card(card_node)
	else:
		send_back_to_hand(card_node)
	done.emit()


func move_card(card_node: Node):
	if card_node.is_in_group(&"resource"):
		card_node.reparent(input_cards_container, false)
	if card_node.is_in_group(&"salamander"):
		if target_card_container.get_child_count() > 0:
			var card_to_move = target_card_container.get_child(0)
			card_to_move.reparent(hand_container, false)
		card_node.reparent(target_card_container, false)


func send_back_to_hand(card_node: Node):
	card_node.reparent(hand_container, false)
