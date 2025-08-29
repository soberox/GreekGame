extends Control
var i = 0
var building_name = ""
var des = ""
var cost = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func setup(name_: StringName, des_: String, cost_: int, index: int) -> void:
	cost = cost
	$VBoxContainer/Label2.text = "%s" % cost;
	i = index
	building_name = name_
	des = des_

func get_i():
	return i
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	Global.buildings[i]["built"] = true
	if Global.buildings[i]["labor"] in ["merchant", "schollar", "blacksmith"]:
		for l in Global.labor:
			if Global.buildings[i]["labor"] == Global.labor[l]["name"]:
				Global.labor[l]["built"] = true
	var parent = get_node("../../..")
	parent.line()


func _on_mouse_entered() -> void:
	GlobalPopup.build_pop(Rect2i(Vector2i(global_position), Vector2i(size)))
	GlobalPopup.setup(building_name, des)


func _on_mouse_exited() -> void:
	GlobalPopup.build_hide()
