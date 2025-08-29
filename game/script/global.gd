class_name global
extends Node

var gold = 0;
var silver = 0;
var bronze = 100;

var exp = 0;
var level_cap = 100;
var level = 240;
var clicks = 0;
var prestige = 5;

var buildings = {
	0:{
		"name": "farm",
		"des": "description",
		"prestige": 0,
		"level": 20,
		"items": ["chicken", "sheep", "goat", "cattle", "pig", "egg", "milk", "bread"],
		"requirement": "",
		"labor": "farmer",
		"built": false,
		"cost": 35,
		"branch": 1,
		"hiarchy": 0,
		"x": 1336,
		"y": 425
	},
	1:{
		"name": "mineshaft",
		"des": "description",
		"prestige": 0,
		"level": 60,
		"items": ["raw bronze", "raw silver", "raw gold", "iron", "copper", "lead", "tin", "marble", "obsidian", "quartz", "lime stone", "sulfer", "salt", "zinc", "granite"],
		"requirement": "",
		"labor": "minor",
		"built": false,
		"cost": 35,
		"branch": 2,
		"hiarchy": 0,
		"x": 843,
		"y": 372
	},
	2:{
		"name": "harbor",
		"des": "description",
		"prestige": 0,
		"level": 45,
		"items": ["fish", "clam", "octopus", "sponge", "tuna", "scalop", "crab", "squid", "sea urchins", "eel", "lobster", "seaweed"],
		"requirement": "",
		"labor": "labor",
		"built": false,
		"cost": 30,
		"branch": 3,
		"hiarchy": 0,
		"x": 976,
		"y": 437
	},
	3:{
		"name": "garden",
		"des": "description",
		"prestige": 1,
		"level": 35,
		"items": ["olive", "honey", "grape",  "fig", "quince", "pomegranate", "wine"],
		"requirement": "",
		"labor": "farmer",
		"built": false,
		"cost": 34,
		"branch": 1,
		"hiarchy": 1,
		"x": 1360,
		"y": 486
	},
	4:{
		"name": "armory",
		"des": "description",
		"prestige": 3,
		"level": 240,
		"items": ["spear", "shield", "sword", "bow", "breast plate", "slingshot"],
		"requirement": "",
		"labor": "blacksmith",
		"built": false,
		"cost": 45,
		"branch": 2,
		"hiarchy": 1,
		"x": 771,
		"y": 430
	},
	5:{
		"name": "market",
		"des": "description",
		"prestige": 0,
		"level": 100,
		"items": ["vase", "tiles", "tar", "Volcanic ash", "cloth", "soap", "fleece","spice", "toy", "glass", "brick"],
		"requirement": "",
		"labor": "merchant",
		"built": false,
		"cost": 50,
		"branches": [1, 2, 3],
		"branch": 2,
		"hiarchy": 2,
		"x": 910,
		"y": 492
	},
	6:{
		"name": "capital",
		"des": "description",
		"prestige": 0,
		"level": 150,
		"items": ["paper", "chisel", "ink", "paint"],
		"requirement": "",
		"labor": "schollar",
		"built": false,
		"cost": 100,
		"branch": 2,
		"hiarchy": 3,
		"x": 883,
		"y": 416
	},
}

var labor = {
	0:{
		"name": "farmer",
		"resources": ["wheat", "chicken", "sheep", "goat", "cattle", "pig", "egg", "milk", "bread", "olive", "honey", "grape",  "fig", "quince", "pomegranate", "wine"],
		"des": "sample",
		"power": 1,
		"icon": "sample",
		"cost": 5,
		"auto_cost": 100,
		"quantity": 1,
		"rate": 0,
		"built": true
	},
	1:{
		"name": "lumberer",
		"resources": ["wood"],
		"des": "sample",
		"power": 1,
		"icon": "sample",
		"cost": 5,
		"auto_cost": 100,
		"quantity": 1,
		"rate": 0,
		"built": true
	},
	2:{
		"name": "miner",
		"resources": ["clay", "raw bronze", "raw silver", "raw gold", "iron", "copper", "lead", "tin", "marble", "obsidian", "quartz", "lime stone", "sulfer", "salt", "zinc", "granite"],
		"des": "sample",
		"power": 1,
		"icon": "sample",
		"cost": 5,
		"auto_cost": 100,
		"quantity": 1,
		"rate": 0,
		"built": true
	},
	3:{
		"name": "fisher",
		"resources": ["water", "fish", "clam", "octopus", "sponge", "tuna", "scalop", "crab", "squid", "sea urchins", "eel", "lobster", "seaweed"],
		"des": "sample",
		"power": 1,
		"icon": "sample",
		"cost": 5,
		"auto_cost": 100,
		"quantity": 1,
		"rate": 0,
		"built": true
	},
	4:{
		"name": "schollar",
		"resources": ["paper", "chisel", "ink", "paint"],
		"des": "sample",
		"power": 1,
		"icon": "sample",
		"cost": 5,
		"auto_cost": 100,
		"quantity": 1,
		"rate": 0,
		"built": false
	},
	5:{
		"name": "blacksmith",
		"resources": ["spear", "shield", "sword", "bow", "breast plate", "slingshot"],
		"des": "sample",
		"power": 1,
		"icon": "sample",
		"cost": 5,
		"auto_cost": 100,
		"quantity": 1,
		"rate": 0,
		"built": false
	},
	6:{
		"name": "merchant",
		"resources": ["vase", "tiles", "tar", "Volcanic ash", "cloth", "soap", "fleece","spice", "toy", "glass", "brick"],
		"des": "sample",
		"power": 1,
		"icon": "sample",
		"cost": 5,
		"auto_cost": 100,
		"quantity": 1,
		"rate": 0,
		"built": false
	}
}

var items = {
	#freebies
	0:{
		"name": "wheat",
		"des": "sample",
		"quantity": 10,
		"value": 5,
		"prestige": 0,
		"color": " #D2B48C"
	},
	1:{
		"name": "wood",
		"des": "sample",
		"quantity": 10,
		"value": 5,
		"prestige": 0,
		"color": "#5C4033"
	},
	2:{
		"name": "clay",
		"des": "sample",
		"quantity": 10,
		"value": 5,
		"prestige": 0,
		"color" : "#B66A50"
	},
	3:{
		"name": "water",
		"des": "sample",
		"quantity": 10,
		"value": 5,
		"prestige": 0,
		"color": "#0000ff"
	},
	#farm
	4:{
		"name": "chicken",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#F2D16B"
	},
	5:{
		"name": "sheep",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 1,
		"color": "#E8E4D8"
	},
	6:{
		"name": "goat",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 1,
		"color": "#D9C9A3"
	},
	7:{
		"name": "cattle",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 2,
		"color": "#8B5A2B"
	},
	8:{
		"name": "pig",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#F5C6C6"
	},
	9:{
		"name": "egg",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#FFF9E6"
	},
	10:{
		"name": "milk",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 2,
		"color": "#FFFFFF"
	},
	11:{
		"name": "bread",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#C68642"
	},
	#garden
	12:{
		"name": "olive",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#708238"
	},
	13:{
		"name": "honey",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 1,
		"color": "#FFC30B"
	},
	14:{
		"name": "grape",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#6F2DA8"
	},
	15:{
		"name": "fig",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 2,
		"color": "#8B4A2B"
	},
	16:{
		"name": "quince",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 2,
		"color": "#EEDC82"
	},
	17:{
		"name": "pomegranate",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 5,
		"color": "#C72C48"
	},
	18:{
		"name": "wine",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#722F37"
	},
	#mineshaft
	19:{
		"name": "raw bronze",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#B08D57"
	},
	20:{
		"name": "raw silver",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 4,
		"color": "#C0C0C0"
	},
	21:{
		"name": "raw gold",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 6,
		"color": "#FFD700"
	},
	22:{
		"name": "iron",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#4B4B4B"
	},
	23:{
		"name": "copper",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 1,
		"color": "#B87333"
	},
	24:{
		"name": "lead",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#575757"
	},
	25:{
		"name": "tin",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 1,
		"color": "#D1D1D1"
	},
	26:{
		"name": "marble",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#E5E4E2"
	},
	27:{
		"name": "obsidian",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 4,
		"color": "#0B0B0B"
	},
	28:{
		"name": "quartz",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 2,
		"color": "#ECE4F3"
	},
	29:{
		"name": "lime stone",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#DCD9C6"
	},
	30:{
		"name": "sulfer",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 1,
		"color": "#FDEE00"
	},
	31:{
		"name": "salt",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 1,
		"color": "#FAFAFA"
	},
	32:{
		"name": "zinc",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 1,
		"color": "#7F7F7F"
	},
	33:{
		"name": "granite",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#8A8A8A"
	},
	#armory
	34:{
		"name": "spear",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#A67B5B"
	},
	35:{
		"name": "shield",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#888C8D"
	},
	36:{
		"name": "sword",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 4,
		"color": "#C0C0C0"
	},
	37:{
		"name": "bow",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 5,
		"color": "#8B4513"
	},
	38:{
		"name": "breast plate",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 4,
		"color": "#A6A6A6"
	},
	39:{
		"name": "slingshot",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#8E735B"
	},
	#harbor
	40:{
		"name": "fish",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#6BA3C4"
	},
	41:{
		"name": "clam",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#E3D5CA"
	},
	42:{
		"name": "octopus",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#A94B73"
	},
	43:{
		"name": "sponge",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 1,
		"color": "#F2C94C"
	},
	44:{
		"name": "tuna",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 2,
		"color": "#486B84"
	},
	45:{
		"name": "scalop",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#E4C59E"
	},
	46:{
		"name": "crab",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 2,
		"color": "#D72638"
	},
	47:{
		"name": "squid",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 2,
		"color": "#CFA5B4"
	},
	48:{
		"name": "sea urchins",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#3B3B3B"
	},
	49:{
		"name": "eel",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#5B7065"
	},
	50:{
		"name": "lobster",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 0,
		"color": "#E94B3C"
	},
	51:{
		"name": "seaweed",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 1,
		"color": "#2E8B57"
	},
	52:{
		"name": "vase",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 5,
		"color": "#D4B483"
	},
	53:{
		"name": "tiles",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 4,
		"color": "#C4A484"
	},
	54:{
		"name": "tar",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 6,
		"color": "#1B1B1B"
	},
	55:{
		"name": "Volcanic ash",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 6,
		"color": "#5C5C5C"
	},
	56:{
		"name": "cloth",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 2,
		"color": "#E6E6FA"
	},
	57:{
		"name": "soap",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 7,
		"color": "#F8F4E3"
	},
	58:{
		"name": "adhesive",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 5,
		"color": "#F4D06F"
	},
	59:{
		"name": "rope",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#C2B280"
	},
	60:{
		"name": "fleece",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 7,
		"color": "#F5F5DC"
	},
	61:{
		"name": "spice",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 9,
		"color": "#A0522D"
	},
	62:{
		"name": "toy",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 4,
		"color": "#FFB347"
	},
	63:{
		"name": "glass",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 2,
		"color": "#CFEDED"
	},
	64:{
		"name": "brick",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 5,
		"color": "#B22222"
	},
	#academy
	65:{
		"name": "paper",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 3,
		"color": "#FAF3E0"
	},
	66:{
		"name": "chisel",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 5,
		"color": "#C0C0C0"
	},
	67:{
		"name": "ink",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 5,
		"color": "#0B0B0B"
	},
	68:{
		"name": "paint",
		"des": "sample",
		"value": 5,
		"quantity": 0,
		"prestige": 6,
		"color": "#FF6347"
	}
}

func quest2_reward():
	silver += 1
	
var quests = {
	0:{
		"name" : "its a start",
		"des" : "have 10 wood, wheat, and water each", 
		"requirement" : '10 <= wheat_quantity and 10 <= wood_quantity and 10 <= water_quantity',
		"reward" : func(): silver += 5,
		"redeemed" : false,
		"level" : 0
	},
	1:{
		"name" : "slave driver",
		"des" : "own 50 workers, and two auto upgrade of any resource", 
		"requirement" : '(50 <= wheat_quantity and 2 <= farmer_rate) or (50 <= wood_quantity and 2 <= lumberer_rate) or (50 <= water_quantity and 2 <= fisher_rate) or (50 <= chicken_quantity and 2 <= farmer_rate)',
		"reward" : func(): gold += 1,
		"redeemed" : false,
		"level" : 3
	},
	2:{
		"name" : "Hades",
		"des" : "have 50 gold", 
		"requirement" : '50 <= gold',
		"reward" : func(): quest2_reward(),
		"redeemed" : false,
		"level" : 15
	},
}


func level_up():
	while exp > level_cap:
		exp -= level_cap
		level += 1
		level_cap *= 1.134

func reset():
	gold = 0
	silver = 0
	bronze = 0
	level = 0
	level_cap = 15
	
	for l in labor.keys():
		labor[l]["cost"] = 5
		labor[l]["auto_cost"] = 100
		labor[l]["quantity"] = 1
		labor[l]["rate"] = 0
	
	for i in items.keys():
		items[i]["quantity"] = 0
		items[i]["value"] = 5
	
	for q in quests.keys():
		quests[q]["redeemed"] = false

func eval(cond: String) -> bool:
	var dictionary = [labor, items]
	var merged = {
		"gold": gold,
		"solver": silver,
		"bronze": bronze,
		"exp": exp,
		"level_cap": level_cap,
		"level": level,
		"clicks": clicks
	}
	
	var count = 0
	for l in labor.keys():
		var q_name = labor[l]["name"] + "_quantity"
		merged[q_name] = labor[l]["quantity"]
		var r_name = labor[l]["name"] + "_resource"
		merged[r_name] = labor[l]["resources"]
		var d_name = labor[l]["name"] + "_description"
		merged[d_name] = labor[l]["des"]
		var p_name = labor[l]["name"] + "_power"
		merged[p_name] = labor[l]["power"]
		var c_name = labor[l]["name"] + "_cost"
		merged[c_name] = labor[l]["cost"]
		var a_name = labor[l]["name"] + "_auto"
		merged[a_name] = labor[l]["auto_cost"]
		var ra_name = labor[l]["name"] + "_rate"
		merged[ra_name] = labor[l]["rate"]
		
	for i in items.keys():
		var q_name = items[i]["name"] + "_quantity"
		merged[q_name] = items[i]["quantity"]
		var d_name = items[i]["name"] + "_description"
		merged[d_name] = items[i]["des"]
		var v_name = items[i]["name"] + "_value"
		merged[v_name] = items[i]["value"]
		
	var expr = Expression.new()
	var parse_result = expr.parse(cond,  merged.keys())
	
	if parse_result != OK:
		push_error("Parse error: s%" %cond)
	
	var values = []
	for key in merged.keys():
		values.append(merged[key])
	
	var result = expr.execute(values, null, true)
	
	if expr.has_execute_failed():
		push_error("Excute error: s%" %cond)
		return false
	return result == true
			
func _process(delta: float) -> void:
	for key in labor.keys():
		var res = labor[key]["resources"]
		var rate = labor[key]["rate"]
		for k in items.keys():
			if (items[k]["name"] in res) && (items[k]["quantity"] > 0) :
				items[k]["quantity"]+= rate * delta
	
	if exp >= level_cap:
		level_up()
