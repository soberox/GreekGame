extends Node2D
var list = Global.quests;
@export var task : PackedScene
@export var spacer : PackedScene 
@onready var container : VBoxContainer = $VScrollBar/VBoxContainer


var stack = []
var  queue = []
var refreshStatus = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var temp
	var index = 0
	for i in range(list.size()):
		if Global.quests[i]["level"] <= Global.level && !(Global.quests[i]["redeemed"]):
			stack.append(i)
		else:
			queue.append(i)
		index += 1
	for s in stack:
		temp = task.instantiate()
		container.add_child(temp)
		var name = list[s]["name"]
		var des = list[s]["des"]
		temp.setup(name, des, s)
		var space = spacer.instantiate()
		container.add_child(space)
	for q in queue:
		temp = task.instantiate()
		container.add_child(temp)
		var name = list[q]["name"]
		var des = list[q]["des"]
		temp.setup(name, des, q)
		var space = spacer.instantiate()
		container.add_child(space)



func update():
	for child in container.get_children():
		child.queue_free()
		stack.clear()
	_ready()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if refreshStatus:
		update()
		refreshStatus = false
	
