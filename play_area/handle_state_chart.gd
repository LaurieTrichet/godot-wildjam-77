extends Node

class_name HandleStateChart

@onready var state_chart: StateChart = $"../StateChart"


func _on_play_animation_move_container_animation_started() -> void:
	state_chart.send_event("play_animation")


func _on_play_animation_move_container_done() -> void:
	state_chart.send_event("did_finish_playing_animation")
