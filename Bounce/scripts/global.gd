extends Node

var currentScene = null

var previous_color = null

var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file
var save_data = {"highscore": 0} #variable to store data

func _ready():
	if not savegame.file_exists(save_path):
    	create_save()
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)
	pass

func create_save():
   savegame.open(save_path, File.WRITE)
   savegame.store_var(save_data)
   savegame.close()

func set_scene(scene):
   #clean up the current scene
   currentScene.queue_free()
   #load the file passed in as the param "scene"
   var s = ResourceLoader.load(scene)
   #create an instance of our scene
   currentScene = s.instance()
   # add scene to root
   get_tree().get_root().add_child(currentScene)

func set_random_background_color():
	
	var possible_colors = ["FF931E", "FF1D25", "7AC943", "3FA9F5", "D4145A", "C69C6D"]
	
	var new_background_color_found = false
	var random_color = null
	while(new_background_color_found != true):
		randomize()
		random_color = Color(possible_colors[randi()%possible_colors.size()])
		if (random_color != previous_color):
			new_background_color_found = true
			
	previous_color = random_color
	VisualServer.set_default_clear_color(random_color)
	pass

func set_highscore(high_score):
	save_data["highscore"] = high_score #data to save
	savegame.open(save_path, File.WRITE) #open file to write
	savegame.store_var(save_data) #store the data
	savegame.close() # close the file
	pass

func get_highscore():
	savegame.open(save_path, File.READ) #open the file
	save_data = savegame.get_var() #get the value
	savegame.close() #close the file
	return save_data["highscore"] #return the value