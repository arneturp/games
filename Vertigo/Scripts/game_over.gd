extends CanvasLayer

onready var anim_player = get_node("anim_player")
onready var game = get_node("..")
onready var lbl_highscore = get_node("score_screen/texture/lbl_highscore")
onready var lbl_score = get_node("score_screen/texture/lbl_score")



var next_scene = ""

func _ready():
	if (Globals.get("SCORE") > Globals.get("HIGHSCORE")):
		Globals.set("HIGHSCORE", Globals.get("SCORE"))
		global.save(Globals.get("SCORE"))
		
	lbl_highscore.set_text(str(Globals.get("HIGHSCORE")))
	lbl_score.set_text(str(Globals.get("SCORE")))
	pass

func _on_btn_replay_pressed():
	anim_player.play("outro")
	next_scene = "game"
	pass

func _on_btn_menu_pressed():
	anim_player.play("outro")
	next_scene = "title_screen"
	pass

func go_to_next_scene():
	global.set_scene("res://Scenes/" + str(next_scene) + ".tscn")
	pass