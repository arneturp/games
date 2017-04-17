extends Node

onready var anim_player = get_node("anim_player")
onready var melon = get_node("watermelon")
onready var lbl_score = get_node("watermelon/lbl")

var next_scene = null

func _ready():
	print("MENU SCENE...")
	anim_player.play("intro")
	if (Globals.get("score") != null):
		lbl_score.set_text(String(Globals.get("score")))
	pass

func _on_btn_start_game_pressed():
	next_scene = "main"
	anim_player.play("outro")
	pass

func _on_btn_statistics_pressed():
	next_scene = "statistics"
	anim_player.play("outro")
	pass

func _on_btn_upgrade_rocket_pressed():
	next_scene = "garage"
	anim_player.play("outro")
	pass

func _on_intro_end():
	anim_player.play("idle")
	pass

func _on_outro_end():
	get_node("/root/globals").set_scene("res://scenes/" + next_scene + ".tscn")
	pass


