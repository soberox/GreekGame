extends Control
var temp
@export var town : PackedScene
@export var market : PackedScene
@export var labor : PackedScene
@export var quest : PackedScene
@export var prestige : PackedScene
@export var level : PackedScene 
@onready var container : Node2D = $Camera2D/Container
@onready var level_btn:  Button = $Camera2D/banner/levels/Level_button
@onready var expBar: ProgressBar = $Camera2D/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	temp = town.instantiate()
	temp.position =  Vector2(-975, -450)
	container.add_child(temp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_bar()
	update_level()


func _on_town_button_pressed():
	container.remove_child(temp)
	temp = town.instantiate()
	temp.position =  Vector2(-975, -450)
	container.add_child(temp)

func _on_market_button_pressed():
	container.remove_child(temp)
	temp = market.instantiate()
	temp.position =  Vector2(-975, -450)	
	container.add_child(temp) 
	
func _on_labro_button_pressed():
	container.remove_child(temp)
	temp = labor.instantiate()
	temp.position =  Vector2(-975, -450)
	container.add_child(temp)

func _on_prestigue_button_pressed():
	container.remove_child(temp)
	temp = prestige.instantiate()
	temp.position =  Vector2(-975, -450)
	container.add_child(temp)

func _on_quest_button_pressed():
	container.remove_child(temp)
	temp = quest.instantiate()
	temp.position =  Vector2(-975, -450)
	container.add_child(temp)

func update_level():
	level_btn.text = "level: %s" % Global.level

func update_bar():
	var max = Global.level_cap
	expBar.max_value = max
	expBar.value = Global.exp


func _on_level_button_pressed() -> void:
	container.remove_child(temp)
	temp = level.instantiate()
	temp.position =  Vector2(-975, -450)
	container.add_child(temp)
