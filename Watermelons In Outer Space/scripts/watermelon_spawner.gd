extends Node2D

onready var scn_watermelon = preload("res://scenes/watermelon.tscn")
onready var watermelon_container = get_node("../watermelon_container")
onready var main = get_node("../../..")

onready var spawns = get_children()

func _ready():
	spawn_watermelon()
	pass

func spawn_watermelon():
	print("Spawning watermelon...")
	randomize()
	var random_spawn = null
	var new_watermelon = scn_watermelon.instance()
	var new_pos_found = false
	while (new_pos_found == false):
		random_spawn = spawns[floor(rand_range(0, spawns.size()))]
		if (Globals.get("watermelon_position") == null or random_spawn.get_pos() != Globals.get("watermelon_position")):
			new_pos_found = true
			
	new_watermelon.set_pos(random_spawn.get_pos())
	Globals.set("watermelon_position", new_watermelon.get_global_pos())
	watermelon_container.add_child(new_watermelon)
	pass

func watermelon_collected():
	spawn_watermelon()
	main.increase_score()
	pass