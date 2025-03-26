extends Node

class_name CardsGroupNames

enum Types {
	card_created_from_recipe,
	booster_pack_open,
	created_card_taken
}

static func get_string_for_group(group_name: CardsGroupNames.Types) -> StringName:
	return CardsGroupNames.Types.find_key(group_name)
