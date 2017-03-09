extends RigidBody2D

export var name = "character"

onready var camera = get_node('../camera')
onready var score_label = get_node('../hud/score')
onready var sample_player = get_node("sample_player")
onready var game_node = get_node('..')
onready var anim_player = get_node('anim_player')

var screen_height = Globals.get("display/height")
var screen_width = Globals.get("display/width")

var playable = true;

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	pass

func _input(ev):
	if (ev.type == InputEvent.MOUSE_BUTTON):
		if (ev.pressed and ev.pos.y > get_pos().y and playable == true):
			# Jump
			var diff_x = ev.pos.x - (get_pos().x - camera.get_global_pos().x)
			var diff_y = ev.pos.y - (get_pos().y - camera.get_global_pos().y)
			set_linear_velocity(Vector2(diff_x, diff_y) * Vector2(-3, -1) + Vector2(0, -600))
			
			# Play sound
			sample_player.play("pop")
	pass

func _fixed_process(delta):
	if (get_pos().y < camera.get_global_pos().y + (screen_height * 0.3)):
		# Update camera
		camera.set_pos(Vector2(camera.get_global_pos().x, get_pos().y - screen_height * 0.3))
	
	if (get_colliding_bodies().size() > 0):
		die()
	
	if (get_pos().y > camera.get_global_pos().y + screen_height):
		die()
	elif (get_pos().x < 0):
		set_pos(Vector2(screen_width, get_pos().y))
	elif (get_pos().x > screen_width):
		set_pos(Vector2(0, get_pos().y))
	pass

func collect_star():
	game_node.update_score()
	pass

func die():
	if (playable == true):
		playable = false;
		sample_player.play("fail")
		anim_player.play('die')
		game_node.stop_game()
	pass

func restart():
	get_node('/root/globals').set_scene("res://scenes/game.tscn")
	pass