extends Node

var pending_scn = null

onready var anim_player = get_node("anim_player")

func _ready():
	pass


func _on_btn_play_pressed():
	pending_scn = "res://scenes/main.tscn"
	anim_player.play("outro")
	pass

func end_of_outro():
	get_node("/root/globals").set_scene(pending_scn)
	pass