extends Node2D
var list = Global.buildings
var nodes = []
var h_max = 0
var b_max = 0
var h_count = 0
var curr_h = 0
var h_min = 0
var b_min = 0
@export var building : PackedScene
@onready var container : Control = $VBoxContainer/Container
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxes()
	for i in list.keys():
		if (list[i]["level"] <= Global.level && list[i]["prestige"] <= Global.prestige):
			var temp = building.instantiate()
			container.add_child(temp)
			temp.setup(list[i]["name"], list[i]["des"], list[i]["cost"], i)
			var childx = temp.size.x
			var childy = temp.size.y
			var margx = 96
			var margy = 40
			container_size(childx, childy, margx, margy)
			nodes.append(temp)
			pos(temp, margx, margy)
	line()
	
func container_size(chx: float, chy: float, margx: float, margy: float):
	var x = b_max * (chx + 2 * margx)
	var y = h_max * (chy + 2 * margy)
	container.custom_minimum_size = Vector2(x,y)	

func maxes():
	var county = 0
	h_min = INF
	b_min = INF
	for i in list.keys():
		if (list[i]["branch"] < b_min) && (list[i]["level"] <= Global.level && list[i]["prestige"] <= Global.prestige):
			b_min = list[i]["branch"]
		if (list[i]["hiarchy"] < h_min) && (list[i]["level"] <= Global.level && list[i]["prestige"] <= Global.prestige):
			h_min = list[i]["hiarchy"]
	h_max = h_min
	b_max = b_min
	for i in list.keys():
		if (list[i]["branch"] > b_max) && (list[i]["level"] <= Global.level && list[i]["prestige"] <= Global.prestige):
			b_max = list[i]["branch"]
		if (list[i]["hiarchy"] > h_max) && (list[i]["level"] <= Global.level && list[i]["prestige"] <= Global.prestige):
			h_max = list[i]["hiarchy"]
			county += 1
	h_max = county + 1
			
func pos(node: TextureButton, margx: float, margy: float):
	var i = node.get_i()
	var contx = container.custom_minimum_size.x
	var conty = container.custom_minimum_size.y
	var branch = 0
	if (b_max < list[i]["branch"]):
		branch = list[i]["branch"] -(list[i]["branch"] - b_max)
	elif (b_min > list[i]["branch"]):
		branch = b_min - list[i]["branch"]
	else:
		branch = list[i]["branch"]
	var hiarchy = 0
	if (curr_h < list[i]["hiarchy"]):
		curr_h = list[i]["hiarchy"]
		h_count += 1
	hiarchy = h_count
	var	x = (contx * (float(branch - 1)) / float(b_max)) + margx
	var y = (conty * (float(hiarchy) / float(h_max))) + margy
	node.position = Vector2(x, y)

func line():
	for i in range(nodes.size()):
		var i_id = nodes[i].get_i()
		var target = -1
		for j in range(nodes.size()):
			var j_id = nodes[j].get_i()
			if ((list[i_id]["branch"] == list[j_id]["branch"]) && (list[i_id]["hiarchy"] == list[j_id]["hiarchy"] - 1)):
				target = j
				break
		if target == -1:
			for j in range(nodes.size()):
				var j_id = nodes[j].get_i()
				if list[j_id].has("branches"):
					if (list[i_id]["branch"] in list[j_id]["branches"]) && (list[i_id]["hiarchy"] <= list[j_id]["hiarchy"]):
						target = j
						break
		if target != -1:
			drawline(nodes[i], nodes[target])
			
func drawline(from: Control, to: Control):
	var Mylines = Line2D.new()
	Mylines.z_index = -1
	if list[from.get_i()]["built"]:
		Mylines.default_color = "cd7f32"
	container.add_child(Mylines)
	Mylines.width = 2
	
	var from_pos = from.position + from.size / 2
	var to_pos = to.position + to.size / 2
	Mylines.add_point(from_pos)
	Mylines.add_point(to_pos)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
