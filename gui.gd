extends Control

@export var wood_action: HBoxContainer
@export var wood_item: HBoxContainer

@onready var items = {"wood": wood_item}


func _ready():
	wood_action.action_completed.connect(_on_action_action_completed)


func _on_action_action_completed(result):
	items[result.name].add_amount(1)
