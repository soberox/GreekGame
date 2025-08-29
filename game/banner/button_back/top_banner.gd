extends HBoxContainer
@export var disp: PackedScene
@onready var bronze: Label = $HBoxContainer2/Label
@onready var silver: Label = $HBoxContainer2/Label2
@onready var gold: Label = $HBoxContainer2/Label3
@onready var preview: HBoxContainer = $HBoxContainer
@onready var button: Button = $Button
@onready var popup_panel: PopupPanel = $PopupPanel
@onready var popup_list: VBoxContainer = $PopupPanel/ScrollContainer/VBoxContainer

var label_pre
var label_pop

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	preview_pop()
	popup_pop()

func preview_pop():
	for p in preview.get_children():
		p.queue_free()
	label_pre = {}
	
	var count = 0
	for i in Global.items.keys():
		if Global.items[i]["quantity"] > 1 && count < 6:
			var display = disp.instantiate()
			preview.add_child(display)
			display.setup(Global.items[i]["name"] ,Global.items[i]["color"], Vector2i(25,25), Vector2i(23,25), 15)
			labeling_pre(i, display)
			count += 1

func popup_pop():
	for p in popup_list.get_children():
		p.queue_free()

	label_pop = {}
	var list = []
	
	for i in Global.items.keys():
		if Global.items[i]["quantity"] > 1:
			var display = disp.instantiate()
			list.append([display, i])
	labeling_pop(list)
	
	var limit = 8
	var rows = list.size()/limit + 1
	var c = 0
	for i in range(rows):
		var row = HBoxContainer.new()
		row.alignment = BoxContainer.ALIGNMENT_CENTER
		for n in range(limit):
			if c == list.size():
				break
			var display = list[c][0]
			var j = list[c][1]
			row.add_child(display)
			display.call_deferred("setup", Global.items[j]["name"], Global.items[j]["color"], Vector2i(25,25), Vector2i(23,25), 15)
			c += 1
		popup_list.add_child(row)

func labeling_pre(i: int, node: Control):
	label_pre[i] = node
	
func labeling_pop(list: Array):
	for  n in list:
		var i = n[1]
		var node = n[0]
		label_pop[i] = node
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bronze.text = "%d" %Global.bronze
	silver.text = "%d" %Global.silver
	gold.text = "%d" %Global.gold
	for i in label_pre.keys():
		var label = label_pre[i].get_node("Label")
		label.text = "%d" %Global.items[i]["quantity"]
	for i in label_pop.keys():
		var label = label_pop[i].get_node("Label")
		label.text = "%d" %Global.items[i]["quantity"]
	

func _on_button_pressed() -> void:
	if popup_panel.visible:
		popup_panel.hide()
	else:
		var gpos = Vector2i(0, 0)
		popup_panel.popup(Rect2i(gpos, Vector2i(preview.size.x * 2, 75)))
	
func update():
	preview_pop()
	popup_pop()
