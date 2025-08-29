extends Control
var cost = 0;
var i = 0;
@onready var auto_but = $VBoxContainer/HBoxContainer/auto

# Called when the node enters the scene tree for the first time.
func setup(name: StringName, des: String, pow: int, price: int, index: int) -> void:
	cost = price
	i = index
	$VBoxContainer/name.text = name;
	$VBoxContainer/HBoxContainer/Label.text = "%s\n Cost: %d\t Power: %d" %[des,cost,pow];


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	auto_but.set_text("auto clicker\n$%d" %Global.labor[i]["auto_cost"])

func _process(delta: float) -> void:
	auto_but.text = "auto clicker\n$%d" %Global.labor[i]["auto_cost"]



func _on_buy_pressed() -> void:
	if (Global.bronze > cost):
		Global.bronze -= cost
		Global.exp += 15
		Global.labor[i]["quantity"] += 1 * Global.prestige	

func _on_auto_pressed() -> void:
	if (Global.bronze > Global.labor[i]["auto_cost"]):
		Global.bronze -= Global.labor[i]["auto_cost"]
		Global.labor[i]["auto_cost"] *= 2
		Global.labor[i]["rate"] += 1
		Global.exp += 35
		
