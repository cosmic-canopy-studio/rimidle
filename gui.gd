extends Control

@onready var items = {"wood": $MainArea/VSplitContainer/Item}


func _ready():
	pass


func _on_action_action_completed(result):
	items[result.name].add_amount(1)
