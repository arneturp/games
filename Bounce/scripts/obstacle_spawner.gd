extends Node2D

var screen_width = Globals.get("display/width")

var obstacles_spawned = 0

onready var obstacle_container = get_node('../obstacle_container')
onready var game_node = get_node('..')

const scn_obst_1 = preload("res://scenes/obstacles/obstacle_1.tscn")
const scn_obst_2 = preload("res://scenes/obstacles/obstacle_2.tscn")
const scn_obst_3 = preload("res://scenes/obstacles/obstacle_3.tscn")
const scn_obst_4 = preload("res://scenes/obstacles/obstacle_4.tscn")
const scn_star = preload("res://scenes/obstacles/star.tscn")

var all_obstacles = [scn_obst_1, scn_obst_2, scn_obst_3, scn_obst_4]
const obstacle_interval = 650

func _ready():
	spawn_obstacle()
	spawn_obstacle()
	spawn_obstacle()
	spawn_obstacle()
	spawn_obstacle()
	pass


func spawn_obstacle():
	randomize()
	if (obstacles_spawned%5 != 0 or obstacles_spawned == 0):
		var new_obst = all_obstacles[randi()%all_obstacles.size()].instance()
		randomize()
		new_obst.set_pos(Vector2(rand_range(100, screen_width - 100), get_pos().y))
		randomize()
		new_obst.set_rot(rand_range(0, 180))
		new_obst.connect("exit_tree", self, "obstacle_removed_from_tree")
		obstacle_container.add_child(new_obst)
	else:
		var new_star = scn_star.instance()
		new_star.set_pos(Vector2(rand_range(100, screen_width - 100), get_pos().y))
		new_star.connect("exit_tree", self, "obstacle_removed_from_tree")
		obstacle_container.add_child(new_star)
	obstacles_spawned += 1;
	go_next_pos()
	pass

func obstacle_removed_from_tree():
	spawn_obstacle()
	pass

func go_next_pos():
	set_pos(Vector2(get_pos().x, get_pos().y - obstacle_interval))
	pass
