extends Node

onready var lbl_name = get_node("garage_pane/lbl_name")
onready var progress_acceleration = get_node("garage_pane/progress_acceleration")
onready var progress_max_speed = get_node("garage_pane/progress_max_speed")
onready var progress_weight = get_node("garage_pane/progress_weight")
onready var rocket_preview = get_node("garage_pane/rocket_preview")
onready var anim_player = get_node("anim_player")
onready var tick = get_node("garage_pane/tick")

onready var rockets = Globals.get("all_rockets")
onready var glob = get_node("/root/globals")

var current_rocket = 0
var next_scene = null

func _ready():
	current_rocket = glob.save_data.rocket
	render_rocket()
	pass

func render_rocket():
	rocket_preview.set_frame(rockets[current_rocket].frame)
	lbl_name.set_text(rockets[current_rocket].name)
	progress_acceleration.set_scale(Vector2((float(rockets[current_rocket].acceleration) / 100), 1))
	progress_max_speed.set_scale(Vector2((float(rockets[current_rocket].max_speed) / 100), 1))
	progress_weight.set_scale(Vector2((float(rockets[current_rocket].weight) / 100), 1))
	if (glob.save_data.rocket == current_rocket):
		tick.set_opacity(1)
	else:
		tick.set_opacity(0)
	pass

func _on_btn_next_pressed():
	current_rocket = (current_rocket + 1) % rockets.size()
	render_rocket()
	pass

func _on_btn_previous_pressed():
	if current_rocket == 0:
		current_rocket = rockets.size() - 1
	else:
		current_rocket -= 1
	render_rocket()
	pass


func _on_btn_select_pressed():
	glob.save_data.rocket = current_rocket
	glob.save_game()
	render_rocket()
	pass

func _on_btn_back_pressed():
	next_scene = "menu"
	anim_player.play("outro")
	pass

func outro_end():
	get_node("/root/globals").set_scene("res://scenes/" + next_scene + ".tscn")
	pass
