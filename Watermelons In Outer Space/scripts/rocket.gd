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

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
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
	pass