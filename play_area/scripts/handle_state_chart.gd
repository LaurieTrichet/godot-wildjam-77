extends Node

class_name HandleStateChart

@onready var state_chart: StateChart = $"../StateChart"

@export var card_accepted_event: CardsGroupNames.Types


func _init() -> void:
	var event = EventBus.get_signal_for_group(card_accepted_event)
	event.connect()

func _on_play_animation_move_container_animation_started() -> void:
	state_chart.send_event(&"play_animation")


func _on_play_animation_move_container_done() -> void:
	state_chart.send_event(&"did_finish_playing_animation")


func show_card_result():
	state_chart.send_event(&"card_created")


func dismiss_card_created_modal():
	state_chart.send_event(&"card_accepted")
