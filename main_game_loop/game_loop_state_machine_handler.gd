extends Node

class_name StateChartHandler

@onready var state_chart: StateChart = $"../StateChart"

func move_to_review_booster_cards():
	state_chart.send_event(&"booster_open")


func move_to_assemble_recipe():
	state_chart.send_event(&"booster_cards_accepted")


func move_to_booster_selected():
	state_chart.send_event(&"booster_selected")
