extends Node

onready var lbl_score = get_node("hud/lbl_score")

func _ready():
	Globals.set("score", 0)
	pass

func increase_score():
	Globals.set("score", Globals.get("score") + 1)
	lbl_score.set_text(String(Globals.get("score")))
	pass