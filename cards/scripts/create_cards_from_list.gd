extends Node

class_name CreateCardsFromList

@export var card_data_list: Array[Resource]

@export var create_animal_card: CreateAnimalCard
@export var create_resource_card: CreateResourceCard

func do():
	card_data_list.map(send_card_data_to_correct_create_module)


func send_card_data_to_correct_create_module(card_data:Resource):
	var card_creator = create_resource_card
	
	if card_data is AnimalCardData:
		card_creator = create_animal_card

	card_creator.cache_data(card_data)
	card_creator.do()
	card_creator.clear_data()
