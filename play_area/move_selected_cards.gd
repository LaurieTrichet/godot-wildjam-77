extends Node

signal ready_to_move(target_node: Node, from_container: Control, to_container: Control)
signal ready_to_swap_places(replaced_node: Node, replacing_node: Node, from_container: Control, to_container: Control)

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
	if ! selectable.selected.is_connected(triage_card_move_event):
		selectable.selected.connect(triage_card_move_event)


func triage_card_move_event(card_node: Node, _selected: bool):
	var card_parent = card_node.get_parent()
	if card_parent == hand_container:
		move_card(card_node, card_parent)
	else:
		send_back_to_hand(card_node, card_parent)


func move_card(card_node: Node, from_container: Control):
	var to_container 
	if card_node.is_in_group(&"resource"):
		to_container = input_cards_container
	if card_node.is_in_group(&"salamander"):
		if target_card_container.get_child_count() > 0:
			var card_to_move = target_card_container.get_child(0)
			var selectable = card_to_move.find_child("Selectable") as Selectable
			selectable and selectable.toggle_selection()
			ready_to_swap_places.emit(card_to_move, card_node, hand_container, target_card_container)
		else:
			to_container = target_card_container
	if to_container:
		ready_to_move.emit(card_node, from_container, to_container)


func send_back_to_hand(card_node: Node, from_container: Control):
	ready_to_move.emit(card_node, from_container, hand_container)
