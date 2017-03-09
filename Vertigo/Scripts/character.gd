extends RigidBody2D

const jump_force = 1100
const speed = 400

onready var raycast_down = get_node("raycast_down")
onready var anim_player = get_node("character_sprites/anim_player")
onready var camera = get_node("../camera")
onready var character_sprites = get_node("character_sprites")
onready var sample_player = get_node("sample_player")
onready var game = get_node("..")

var next_animation = ""
var current_animation = ""
var animation_blend = 0

var next_direction = ""
var current_direction = ""

var allow_jump = true

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	move_character()
	animate_character()
	move_camera()
	pass

func move_character():
	if (raycast_down.is_colliding() && allow_jump):
		jump_up()
	else:
		if (get_linear_velocity().y > 0):
			allow_jump = true
		
	
	if (Input.is_action_pressed("go_left")):
		next_direction = "left"
		set_linear_velocity(Vector2(-speed, get_linear_velocity().y))
	elif (Input.is_action_pressed("go_right")):
		set_linear_velocity(Vector2(speed, get_linear_velocity().y))
		next_direction = "right"
	else:
		set_linear_velocity(Vector2(0, get_linear_velocity().y))
	
	# Flip sprites to direction
	if (current_direction != next_direction):
		current_direction = next_direction
		if (next_direction == "left"):
			character_sprites.set_scale(Vector2(-1, 1))
		elif (next_direction == "right"):
			character_sprites.set_scale(Vector2(1, 1))
	
	# Check if player is out of screen
	if (get_pos().y > camera.get_pos().y + (get_viewport().get_visible_rect().size.y / 2)):
		game.stop_game()
	pass

func jump_up():
	set_linear_velocity(Vector2(get_linear_velocity().x, -jump_force))
	if (raycast_down.get_collider().is_in_group("platforms")):
		if (raycast_down.get_collider().jumped_on == false):
			if (raycast_down.get_collider().platform_mode == "booster"):
				set_linear_velocity(Vector2(get_linear_velocity().x, -jump_force * 1.8))
				game.add_point(5)
				sample_player.play("booster")
			else:
				game.add_point(1)
				sample_player.play("pop")
				
			raycast_down.get_collider().jumped_on = true
		if (Globals.get("SCORE") > 3):
			raycast_down.get_collider().fade_out_platform()
	else:
		sample_player.play("pop")
		
	allow_jump = false
	pass

func animate_character():
	if (get_linear_velocity().y > 0): # Player is going down
		next_animation = "jump_down"
		animation_blend = .4
	elif (get_linear_velocity().y < 0): # Player is going up
		next_animation = "jump_up"
		animation_blend = 0
	
	if (current_animation != next_animation):
		current_animation = next_animation
		anim_player.play(current_animation, animation_blend)
	
	pass

func move_camera():
	if (camera.get_pos().y > get_pos().y):
		camera.set_pos(Vector2(camera.get_pos().x, get_pos().y))
	pass