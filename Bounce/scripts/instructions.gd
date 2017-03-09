extends Node

func _ready():
	pass


func _on_btn_back_pressed():
	get_node('/root/globals').set_scene("res://scenes/menu.tscn")
	pass
