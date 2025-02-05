extends Node


@onready var open_pack_panel_container: PanelContainer = %OpenPackPanelContainer
@onready var play_area_container: VBoxContainer = %PlayAreaContainer
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_area_container.visible = false
	open_pack_panel_container.visible = true


func activate_play_area() -> void:
	open_pack_panel_container.visible = false
	play_area_container.visible = true
