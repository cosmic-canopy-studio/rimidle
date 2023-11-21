extends HBoxContainer

signal action_completed

@export var gain_rate: float = 1
@export var effort_amount: float = 100

@onready var action_button := %Action
@onready var action_progress := %ActionProgress
@onready var current_amount := %CurrentAmount
@onready var product_icon := %Icon

func _ready():
	action_progress.max_value = effort_amount
	
func _process(delta):
	var gain = gain_rate * delta
	var new_amount = action_progress.value + gain_rate
	if new_amount > effort_amount:
		action_completed.emit()
		var remainder = fmod(new_amount, effort_amount)
		action_progress.value = remainder
		return
	action_progress.value = new_amount

