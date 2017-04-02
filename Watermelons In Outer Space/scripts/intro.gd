extends Node

onready var anim_player = get_node("anim_player")

func _ready():
	pass

func _on_intro_end():
	get_node("/root/globals").set_scene("res://scenes/menu.tscn")
	pass