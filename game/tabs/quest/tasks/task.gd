extends Control
var i = 0;
var increment = 0;


func setup(name: StringName, des: String, index: int) -> void:
	$HBoxContainer/MarginContainer2/VBoxContainer2/name.text = name;
	$HBoxContainer/MarginContainer2/VBoxContainer2/Label.text = des;
	i = index;
# Called when the node enters the scene tree for the first time.
	
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.eval(Global.quests[i]["requirement"]) && !(Global.quests[i]["redeemed"]):
		$HBoxContainer/MarginContainer/VBoxContainer/claim.disabled = false
	if Global.quests[i]["redeemed"]:
		$".".theme = preload("res://assets/scenes/disabled.tres")


func _on_claim_pressed() -> void:
	var reward = Global.quests[i]["reward"]
	reward.call()
	Global.quests[i]["redeemed"] = true
	var parent = get_node("../../..")
	parent.refreshStatus = true
	
func get_i():
	return i
