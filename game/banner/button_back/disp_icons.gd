extends Control

@onready var rect: ColorRect = $ColorRect
@onready var lab: Label = $Label
@onready var pop: PopupPanel = $PopupPanel
@onready var pop_lab: Label = $PopupPanel/Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setup(n: String, color: String, rectSize: Vector2i, qtySize: Vector2i, font_size: int = 10):
	rect.color = color
	rect.custom_minimum_size = rectSize
	lab.custom_minimum_size = qtySize
	lab.add_theme_font_size_override("font_size", font_size)
	pop_lab.text = n

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_color_rect_mouse_entered() -> void:
	var rect_pos = rect.get_global_rect()
	var screen_size = get_viewport_rect().size
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

func _on_color_rect_mouse_exited() -> void:
	pop.hide()
