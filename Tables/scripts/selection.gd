extends Node

var pending_scn = null

onready var anim_player = get_node("anim_player")
onready var panel_selection = get_node("panel_selection")

func _ready():
	pass


func go_to_next_scene():
	pending_scn = "res://scenes/main.tscn"
	anim_player.play("outro")
	pass

func end_of_outro():
	get_node("/root/globals").set_scene(pending_scn)
	pass