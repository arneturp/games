extends Node

#The currently active scene
var current_scene = null

func _ready():
	current_scene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)
	
	create_rockets()
	
	if (Globals.get("rocket") == null):
		Globals.set("rocket", Globals.get("all_rockets")[0])
	pass

func set_scene(scene):
   current_scene.queue_free()
   var s = ResourceLoader.load(scene)
   current_scene = s.instance()
   get_tree().get_root().add_child(current_scene)

func create_rockets():
	var all_rockets = []
	var rocket_1 = {
		"frame": 0,
		"name": "Red Blaster",
		"acceleration": 90,
		"max_speed": 50,
		"weight": 60
	}
	all_rockets.push_back(rocket_1)
	
	var rocket_2 = {
		"frame": 1,
		"name": "Bluester Booster",
		"acceleration": 10,
		"max_speed": 20,
		"weight": 60
	}
	all_rockets.push_back(rocket_2)
	
	var rocket_3 = {
		"frame": 2,
		"name": "Viper Violetta",
		"acceleration": 70,
		"max_speed": 50,
		"weight": 80
	}
	all_rockets.push_back(rocket_3)
	
	var rocket_4 = {
		"frame": 3,
		"name": "Orangensaft",
		"acceleration": 70,
		"max_speed": 60,
		"weight": 90
	}
	all_rockets.push_back(rocket_4)
	
	var rocket_5 = {
		"frame": 4,
		"name": "Melona Master",
		"acceleration": 10,
		"max_speed": 50,
		"weight": 20
	}
	all_rockets.push_back(rocket_5)
	
	Globals.set("all_rockets", all_rockets)
	pass