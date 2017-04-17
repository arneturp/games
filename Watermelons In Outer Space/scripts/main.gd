extends Node

onready var lbl_score = get_node("hud/lbl_score")
onready var timer = get_node("hud/timer")
onready var rocket = get_node("rocket")
onready var anim_player = get_node("anim_player")
onready var glob = get_node("/root/globals")

func _ready():
	print("MAIN SCENE...")
	Globals.set("score", 0)
	rocket.connect("rocket_crashed", self, "_on_rocket_crashed")
	rocket.connect("rocket_outro_ended", self, "_on_rocket_outro_ended")
	get_tree().set_pause(true)
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	timer.set_scale(Vector2( timer.get_scale().x - (delta/60), 1))
	if (timer.get_scale().x <= 0):
		game_over()
		timer.set_scale(Vector2(0, 1))
	pass
	
func increase_score():
	Globals.set("score", Globals.get("score") + 1)
	lbl_score.set_text(String(Globals.get("score")))
	pass

func unpause_game():
	get_tree().set_pause(false)
	pass

func _on_rocket_crashed():
	game_over()
	pass
	
func game_over():
	anim_player.play("game_over")
	rocket.game_over()
	pass

func _on_rocket_outro_ended():
	get_tree().set_pause(false)
	glob.set_scene("res://scenes/menu.tscn")
	pass