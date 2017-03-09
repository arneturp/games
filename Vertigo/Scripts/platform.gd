
extends KinematicBody2D

const min_speed = 200
const max_speed = 600
const half_width = 140

onready var camera = get_node("../../camera")
onready var anim_player = get_node("anim_player")
onready var sprites = get_node("sprites")

var platform_mode = "default"
var speed = 0
var jumped_on = false

func _ready():
	randomize_speed()
	set_fixed_process(true)
	
	# Set platform mode
	if (platform_mode == "default"):
		sprites.set_frame(0)
	elif (platform_mode == "booster"):
		sprites.set_frame(1)
	pass

func _fixed_process(delta):
	if (get_pos().y - camera.get_pos().y > 1500):
		queue_free()
	
	if ((speed < 0) && (get_pos().x + (speed * delta) < half_width)) || ((speed > 0) && (get_pos().x + (speed * delta) > 1080 - half_width)):
			speed = -speed

	set_pos(Vector2(get_pos().x + (speed * delta), get_pos().y))
	pass

func randomize_speed():
	speed = -rand_range(min_speed, max_speed)
	pass

func fade_out_platform():
	anim_player.play("die")
	pass

func remove_platform():
	queue_free()
	pass
