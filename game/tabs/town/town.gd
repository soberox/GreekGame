extends Node2D
@onready var water: TextureButton = $water
@onready var pop_water: PopupPanel = $water/PopupPanel2
@onready var wood: TextureButton = $wood
@onready var pop_wood: PopupPanel = $wood/PopupPanel2
@onready var wheat: TextureButton = $wheat
@onready var pop_wheat: PopupPanel = $wheat/PopupPanel2
@onready var clay: TextureButton = $clay
@onready var pop_clay: PopupPanel = $clay/Popup
@export var building: PackedScene
var list = Global.buildings
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var temp
	var index = 0
	for i in list.keys():	
		if list[i]["built"]:
			temp = building.instantiate()
			temp.setup(i)
			add_child(temp)
			temp.position = Vector2i(list[i]["x"], list[i]["y"])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_water_pressed() -> void:
	Global.items[3]["quantity"] += 1 * Global.labor[3]["quantity"] * Global.prestige	

func _on_wood_pressed() -> void:
	Global.items[1]["quantity"] += 1 * Global.labor[1]["quantity"] * Global.prestige	

func _on_wheat_pressed() -> void:
	Global.items[0]["quantity"] += 1 * Global.labor[0]["quantity"] * Global.prestige	

func _on_clay_pressed() -> void:
	Global.items[2]["quantity"] += 1 * Global.labor[2]["quantity"] * Global.prestige	

func pop_pos(rect: TextureButton, pop: PopupPanel):
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

func _on_water_mouse_entered() -> void:
	pop_pos(water, pop_water)

func _on_water_mouse_exited() -> void:
	pop_water.hide()

func _on_wood_mouse_entered() -> void:
	pop_pos(wood, pop_wood)

func _on_wood_mouse_exited() -> void:
	pop_wood.hide()

func _on_wheat_mouse_entered() -> void:
	pop_pos(wheat, pop_wheat)

func _on_wheat_mouse_exited() -> void:
	pop_wheat.hide()
func _on_clay_mouse_entered() -> void:
	pop_pos(clay, pop_clay)

func _on_clay_mouse_exited() -> void:
	pop_clay.hide()
