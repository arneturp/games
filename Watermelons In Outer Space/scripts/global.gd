extends Node

var all_rockets = []
var current_scene = null
var savegame = File.new()
var save_path = "user://savegame.save"
var save_data = {
	"highscore": 0,
	"watermelons_collected": 0,
	"rounds_played": 0,
	"rocket": 0,
}

func _ready():
	current_scene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)
	
	create_rockets()
	
	if not savegame.file_exists(save_path):
		create_save()
		
	savegame.open(save_path, File.READ) #open the file
	save_data = savegame.get_var() #get the value
	savegame.close() #close the file
	
	if (Globals.get("rocket") == null):
		Globals.set("rocket", Globals.get("all_rockets")[0])
	pass
	
func create_save():
	savegame.open(save_path, File.WRITE)
	savegame.store_var(save_data)
	savegame.close()
	pass

func save_game():  
   savegame.open(save_path, File.WRITE)
   savegame.store_var(save_data)
   savegame.close()

func read_save(n):
   savegame.open(save_path, File.READ) #open the file
   save_data = savegame.get_var() #get the value
   savegame.close() #close the file
   return save_data[n] #return the value

func set_scene(scene):
   current_scene.queue_free()
   var s = ResourceLoader.load(scene)
   current_scene = s.instance()
   get_tree().get_root().add_child(current_scene)

func create_rockets():
	
	var rocket_1 = {
		"frame": 0,
		"name": "Red Blaster",
		"acceleration": 92,
		"max_speed": 64,
		"weight": 20,
		"rot_speed": 2,
		"thrust": 1000,
		"max_vel": 500
	}
	all_rockets.push_back(rocket_1)
	
	var rocket_2 = {
		"frame": 1,
		"name": "Bluester Booster",
		"acceleration": 50,
		"max_speed": 80,
		"weight": 25,
		"rot_speed": 2,
		"thrust": 700,
		"max_vel": 700
	}
	all_rockets.push_back(rocket_2)
	
	var rocket_3 = {
		"frame": 2,
		"name": "Viper Violetta",
		"acceleration": 30,
		"max_speed": 45,
		"weight": 90,
		"rot_speed": 4,
		"thrust": 400,
		"max_vel": 400
	}
	all_rockets.push_back(rocket_3)
	
	var rocket_4 = {
		"frame": 3,
		"name": "Orangensaft",
		"acceleration": 90,
		"max_speed": 30,
		"weight": 60,
		"rot_speed": 2.6,
		"thrust": 1000,
		"max_vel": 300
	}
	all_rockets.push_back(rocket_4)
	
	var rocket_5 = {
		"frame": 4,
		"name": "Melona Master",
		"acceleration": 40,
		"max_speed": 90,
		"weight": 45,
		"rot_speed": 2.3,
		"thrust": 500,
		"max_vel": 800
	}
	all_rockets.push_back(rocket_5)
	
	Globals.set("all_rockets", all_rockets)
	pass