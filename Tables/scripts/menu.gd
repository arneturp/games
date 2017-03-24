extends Node

var pending_scn = null

onready var anim_player = get_node("anim_player")

func _ready():
	pass

func end_of_outro():
	get_node("/root/globals").set_scene(pending_scn)
	pass

func _on_btn_start_game_pressed():
	anim_player.play("outro")
	pending_scn = "res://scenes/selection.tscn"
	pass
