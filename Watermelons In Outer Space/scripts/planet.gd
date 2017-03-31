extends KinematicBody2D

var speed = null

func _ready():
	# Random rotation speed
	randomize()
	speed = rand_range(-1, 1)
	speed = speed * 15
	
	# Set fixed process
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	set_rotd(get_rotd() + (speed * delta))
	pass