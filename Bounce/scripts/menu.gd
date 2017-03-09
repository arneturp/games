extends Node

onready var anim_player = get_node('anim_player')
onready var lbl_highscore = get_node('lbl_highscore')

func _ready():
	get_node('/root/globals').set_random_background_color()
	lbl_highscore.set_text("Best: " + str(get_node('/root/globals').get_highscore()))
	pass

func intro_anim_stopped():
	print('lmlkj')
	anim_player.play('logo_bounce')
	pass

func _on_btn_start_pressed():
	get_node('/root/globals').set_scene("res://scenes/game.tscn")
	pass # replace with function body


func _on_btn_instructions_pressed():
	get_node('/root/globals').set_scene("res://scenes/instructions.tscn")
	pass # replace with function body
