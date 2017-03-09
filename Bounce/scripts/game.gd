extends Node

var paused = true

var score = 0;

onready var lbl_score = get_node('hud/score')
onready var stream_player = get_node('stream_player')
onready var anim_player = get_node('anim_player')

func _ready():
	set_process_input(true)
	randomize()
	get_node('/root/globals').set_random_background_color()
	get_tree().set_pause(true)
	pass

func _input(ev):
	if (ev.type == InputEvent.MOUSE_BUTTON and paused == true):
		if (ev.pressed):
			get_tree().set_pause(false)
			stream_player.play()
			paused = false
	pass

func set_random_background_color():
	var possible_colors = ["FF931E", "FF1D25", "7AC943", "3FA9F5"]
	VisualServer.set_default_clear_color(Color(possible_colors[randi()%possible_colors.size()]))
	pass


func _on_btn_close_pressed():
	get_node('/root/globals').set_scene("res://scenes/menu.tscn")
	pass

func stop_game():
	anim_player.play("music_fade_out")
	if (score > get_node('/root/globals').get_highscore()):
		get_node('/root/globals').set_highscore(score)
	pass

func update_score():
	score = score + 1
	lbl_score.set_text(str(score))
	pass