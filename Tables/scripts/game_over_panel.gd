extends Control

onready var lbl_score = get_node("panel/lbl_score")
onready var lbl_highscore = get_node("panel/lbl_highscore")
onready var lbl_correct = get_node("panel/lbl_correct")
onready var lbl_wrong = get_node("panel/lbl_wrong")

func _ready():
	pass

func fill_out_labels():
	lbl_score.set_text(str(Globals.get("SCORE")))
	lbl_highscore.set_text(str(Globals.get("SCORE")))
	lbl_correct.set_text(str(Globals.get("ANSWERS_CORRECT")))
	lbl_wrong.set_text(str(Globals.get("ANSWERS_WRONG")))
	pass