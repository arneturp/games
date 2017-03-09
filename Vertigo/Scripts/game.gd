
extends Node2D

onready var anim_player = get_node("anim_player")

var scn_game_over = preload("res://Scenes/game_over.tscn")
onready var camera = get_node("camera")
onready var lbl_score = get_node("canvas_layer/lbl_score")


var game_over = false

func _ready():
	Globals.set("SCORE", 0)
	pass
	
func stop_game():
	if (game_over == false):
		game_over = true
		anim_player.play("outro")
	pass

func show_game_over():
	var game_over_screen = scn_game_over.instance()
	add_child(game_over_screen)
	pass

func add_point(amount):
	Globals.set("SCORE", Globals.get("SCORE") + amount)
	lbl_score.set_text(str(Globals.get("SCORE")))
	pass

