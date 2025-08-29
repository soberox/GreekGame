extends Control


func setup(name: String, des: String):
	$CanvasLayer/PopupPanel/VBoxContainer/Label.text = name
	$CanvasLayer/PopupPanel/VBoxContainer/Label2.text = des
	
func build_pop(build : Rect2i):
	var mous_pos = get_viewport().get_mouse_position()
	var correction
	var padding = 4
	
	if mous_pos.x <= float(get_rect().size.x / 2.0):
		correction = Vector2i(build.size.x + padding, 0)
	else:
		correction = -Vector2i(%PopupPanel.size.x + padding, 0)
	%PopupPanel.popup(Rect2i(build.position + correction, %PopupPanel.size))

func build_hide():
	%PopupPanel.hide()
