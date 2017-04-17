extends Node

onready var anim_player = get_node("anim_player")
onready var lbl_highscore = get_node("highscore/value")
onready var lbl_watermelons_collected = get_node("watermelons_found/value")
onready var lbl_rounds_played = get_node("rounds_played/value")
onready var lbl_average = get_node("average_per_round/value")
onready var glob = get_node("/root/globals")

func _ready():
	render_stats()
	pass

func render_stats():
	lbl_highscore.set_text(String(glob.save_data.highscore))
	lbl_watermelons_collected.set_text(String(glob.save_data.watermelons_collected))
	lbl_rounds_played.set_text(String(glob.save_data.rounds_played))
	if glob.save_data.rounds_played > 0:
		lbl_average.set_text(String(round(glob.save_data.watermelons_collected / glob.save_data.rounds_played)))
	pass

func _on_btn_back_pressed():
	anim_player.play("outro")
	pass

func back_to_menu():
	get_node("/root/globals").set_scene("res://scenes/menu.tscn")
	pass