extends Node2D

var next_scene = ""

onready var globals = get_node("/root/global")
onready var anim_player = get_node("anim_player")
onready var lbl_highscore = get_node("animation_container/lbl_highscore")

func _ready():
	lbl_highscore.set_text("Highscore: " + str(Globals.get("HIGHSCORE")))
	pass

func go_to_next_scene():
	if (next_scene != null):
		globals.set_scene("res://Scenes/" + str(next_scene) + ".tscn")
	pass

func start_outro():
	anim_player.play("outro")
	pass

func _on_btn_start_pressed():
	next_scene = "game"
	start_outro()
	pass


func _on_btn_instructions_pressed():
	next_scene = "instructions"
	start_outro()
	pass
