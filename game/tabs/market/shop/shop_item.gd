extends Control

var cost = 0;
var quant = 0;
var index = null
# Called when the node enters the scene tree for the first time.
func setup(name: StringName, des: String, price: int, quantity: int, i: int) -> void:
	quant = quantity
	cost = price
	index = i
	$VBoxContainer/name.text = name;
	$VBoxContainer/HBoxContainer/Label.text = "%s\n Cost: %d" %[des,cost];


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sell_pressed() -> void:
	if (quant > 0):
		Global.bronze += cost * quant
		Global.exp += 3*Global.items[index]["quantity"]
		Global.items[index]["quantity"] = 0
		get_parent().get_parent().get_parent().get_parent().get_parent().get_node("PanelContainer/HBoxContainer").update()
