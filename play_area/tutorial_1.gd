extends Node


@onready var open_pack_panel_container: PanelContainer = %OpenPackPanelContainer
@onready var play_area_container: VBoxContainer = %PlayAreaContainer

@onready var pack_container: HBoxContainer = %PackContainer

@export var hand_container: HBoxContainer 
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_area_container.visible = false
	open_pack_panel_container.visible = true


func send_to_hand():
	open_pack_panel_container.visible = false
	play_area_container.visible = true
	var cards = pack_container.get_children()
	cards.map(func (card:Node): card.reparent(hand_container))


func activate_card():
	pass
