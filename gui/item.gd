extends HBoxContainer

@export var item_resource: ItemResource
@export var starting_amount: int

var item_type: String
var item_amount: set = _set_item_amount

@onready var item_icon := %Icon
@onready var item_name := %Name
@onready var item_amount_label := %Amount

func _ready():
	item_icon.texture = item_resource.icon
	item_name.text = item_resource.name
	item_type = item_resource.type
	item_amount = starting_amount

func _set_item_amount(amount: int):
	item_amount = amount
	item_amount_label.text = str(amount)


func add_amount(amount: int):
	item_amount += amount


