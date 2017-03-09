extends Node2D

# Export variables
const interval = 350

const scn_platform = preload("res://Scenes/platform.tscn")
const INTERVAL_SPAWNER_CHARACTER = 2000;

onready var platform_container = get_node("../platform_container")
onready var character = get_node("../character")

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if (character.get_pos().y - get_pos().y  < INTERVAL_SPAWNER_CHARACTER):
		go_up()
		spawn_platform()
	pass

func go_up():
	set_pos(get_pos() - Vector2(0, interval))
	pass

func spawn_platform():
	var platform = scn_platform.instance()
	platform.add_to_group("platforms")
	platform.set_pos(get_pos())
	if (rand_range(0, 20) < 2):
		platform.platform_mode = "booster";
		randomize()
	platform_container.add_child(platform)
	pass

