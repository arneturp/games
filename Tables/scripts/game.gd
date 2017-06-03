extends Node

var game_over = false
onready var timer = get_node("timer")
onready var panel_quiz = get_node("panel_quiz")
onready var anim_player = get_node("anim_player")
onready var game_over_panel = get_node("game_over_panel")
var pending_scn = null


func _ready():
	timer.connect("no_time_left", self, "_timer_stopped")

func _timer_stopped():
	get_tree().set_pause(true)
	if (Globals.get('SCORE') > get_node("/root/globals").get_highscore()):
		get_node("/root/globals").save_highscore(Globals.get('SCORE'))
	game_over_panel.fill_out_labels()
	anim_player.play("game_over")
	pass

func end_of_outro():
	get_tree().set_pause(false)
	get_node("/root/globals").set_scene(pending_scn)
	pass

func _on_btn_replay_pressed():
	anim_player.play("outro_with_game_over")
	pending_scn = "res://scenes/main.tscn"
	pass


func _on_btn_twitter_pressed():
	OS.shell_open("https://twitter.com/intent/tweet?text=I+just+played+Tables,+a+fun+educational+game.+I+scored+" + str(Globals.get("SCORE")) + "!+And+you?+Get+it+here:+http//turpoint.com/games/tables")
	pass


func _on_btn_menu_pressed():
	anim_player.play("outro_with_game_over")
	pending_scn = "res://scenes/menu.tscn"
	pass


func _on_btn_quit_pressed():
	anim_player.play("outro")
	pending_scn = "res://scenes/menu.tscn"
	pass

func render_highscore():
	pass
