extends TextureButton
@onready var pop: PopupPanel = $PopupPanel
@onready var pop_lab: Label = $PopupPanel/Label

var index
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setup(i: int):
	index = i
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_mouse_entered() -> void:
	pop_lab.text = Global.buildings[index]["name"]
	var rect_pos = get_global_rect()
	var screen_size = get_parent().get_viewport_rect().size
	var pop_size = pop.size
	var correction
	var padding = 4
	var right = screen_size.x - rect_pos.end.x
	var left = rect_pos.position.x
	
	if right >= pop_size.x:
		correction = Vector2i(rect_pos.end.x + padding, rect_pos.position.y)
	else:
		correction = Vector2i(rect_pos.position.x - pop_size.size.x + padding, rect_pos.position.y)
	pop.position = correction
	pop.popup()

func _on_mouse_exited() -> void:
	pop.hide()


func _on_pressed() -> void:
	var list = Global.buildings
	var entry = list[index]["items"]
	var level = Global.level
	var prestige = Global.prestige
	var items = Global.items
	var labor = Global.labor
	for i in entry:
		var m
		var n
		for k in items.keys():
			if items[k]["name"] == i:
				m = k
				break
		for k in labor.keys():
			if i in labor[k]["resources"]:
				n = k
				break
		if (items[m]["prestige"] <= prestige):
			items[m]["quantity"] += 1 * labor[n]["quantity"] * prestige	
	get_parent().get_parent().get_parent().get_node("PanelContainer/HBoxContainer").update()
	
