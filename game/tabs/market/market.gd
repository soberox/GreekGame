extends Node2D
var list = Global.items;
@export var item : PackedScene
@export var spacer : PackedScene 
@onready var container : VBoxContainer = $VScrollBar/VBoxContainer

var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(list.size()):
		if list[i]["quantity"]  > 0:
			var temp = item.instantiate()
			container.add_child(temp)
			var name = list[i]["name"]
			var des = list[i]["des"]
			var val = list[i]["value"]
			var quant = list[i]["quantity"]
			temp.setup(name, des, val, quant, index)
			temp = spacer.instantiate()
			container.add_child(temp)
			index += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
