extends Node

class_name AddNodeToParent

@export var target_container: Node

func do( node: Node):
	target_container.add_child(node)
