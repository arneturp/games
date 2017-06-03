extends Node

var current_scene = null

var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file
var save_data = {"highscore": 0} #variable to store data


func _ready():
	current_scene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)
	if not savegame.file_exists(save_path):
    	create_save()
	pass

func set_scene(scene):
   #clean up the current scene
   current_scene.queue_free()
   #load the file passed in as the param "scene"
   var s = ResourceLoader.load(scene)
   #create an instance of our scene
   current_scene = s.instance()
   # add scene to root
   get_tree().get_root().add_child(current_scene)

func create_save():
   savegame.open(save_path, File.WRITE)
   savegame.store_var(save_data)
   savegame.close()

func save_highscore(high_score):    
   save_data["highscore"] = high_score #data to save
   savegame.open(save_path, File.WRITE) #open file to write
   savegame.store_var(save_data) #store the data
   savegame.close() # close the file

func get_highscore():
   savegame.open(save_path, File.READ) #open the file
   save_data = savegame.get_var() #get the value
   savegame.close() #close the file
   return save_data["highscore"] #return the value
