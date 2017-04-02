extends Node

onready var anim_player = get_node("anim_player")

func _ready():
	pass

func _on_btn_back_pressed():
	anim_player.play("outro")
	pass

func back_to_menu():
	get_node("/root/globals").set_scene("res://scenes/menu.tscn")
	pass