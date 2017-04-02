extends KinematicBody2D

export var rot_speed = 2.6
export var thrust = 500
export var max_vel = 400
export var friction = 0.65

var rot = 0
var pos = Vector2()
var vel = Vector2()
var acc = Vector2()

onready var particles = get_node("particles")
onready var arrow = get_node("arrow")
onready var sprite = get_node("sprite")
onready var camera = get_node("camera")
onready var screen_size = get_viewport().get_rect().size

func _ready():
	set_rocket()
	pos = Vector2(1920/2, 1080/2)
	set_fixed_process(true)
	pass

func set_rocket():
	var selected_rocket = Globals.get("rocket")
	sprite.set_frame(selected_rocket.frame)
	
	pass

func _fixed_process(delta):
	# Control rocket
	if Input.is_action_pressed("rocket_left"):
		rot += rot_speed * delta
	if Input.is_action_pressed("rocket_right"):
		rot -= rot_speed * delta
	if Input.is_action_pressed("rocket_accelerate"):
		acc = Vector2(thrust, 0).rotated(rot)
		particles.set_emitting(true)
	else:
		acc = Vector2(0, 0)
		particles.set_emitting(false)
	
	acc += vel * -friction
	vel += acc * delta
	pos += vel * delta
	set_pos(pos)
	set_rot(rot - PI/2)
	
	# Point arrow
	point_arrow()
	
	pass

func point_arrow():
	if (
		Globals.get("watermelon_position").x > (camera.get_global_pos().x - screen_size.x/2) and
		Globals.get("watermelon_position").x < (camera.get_global_pos().x + screen_size.x/2) and
		Globals.get("watermelon_position").y > (camera.get_global_pos().y - screen_size.y/2) and
		Globals.get("watermelon_position").y < (camera.get_global_pos().y + screen_size.y/2)
	):
		arrow.set_opacity(0)
	else:
		arrow.set_opacity(1)
		arrow.set_rot(((Globals.get("watermelon_position").angle_to_point(get_pos())) - get_rot() - PI))
	pass