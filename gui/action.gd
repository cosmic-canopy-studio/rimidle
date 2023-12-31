extends HBoxContainer

signal action_completed(result: ItemResource)

@export var gain_rate: float = 1
@export var effort_amount: float = 100
@export var result: ItemResource

@onready var action_button := %Action
@onready var action_progress := %ActionProgress
@onready var effort := %Effort
@onready var product_icon := %Icon


func _ready():
	action_progress.max_value = effort_amount
	product_icon.texture = result.icon
	effort.text = str(effort_amount)


func _process(delta):
	var gain = gain_rate * delta
	var new_amount = action_progress.value + gain_rate
	if new_amount > effort_amount:
		action_completed.emit(result)
		var remainder = fmod(new_amount, effort_amount)
		action_progress.value = remainder
		return
	action_progress.value = new_amount
