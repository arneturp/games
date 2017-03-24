extends TextureFrame

var timer_length = 870

onready var mask = get_node("mask")
onready var particles = get_node("mask/particles")


var time_left = true

signal no_time_left

func _ready():
	set_fixed_process(true)
	
	pass

func _fixed_process(delta):
	if (time_left):
		if (mask.get_pos().x < 502):
			game_over()
		else:
			mask.set_pos(Vector2(mask.get_pos().x - ((870/10) * delta), mask.get_pos().y))
	pass

func game_over():
	mask.set_pos(Vector2(475, mask.get_pos().y))
	time_left = false
	particles.set_emitting(false)
	emit_signal("no_time_left")
	pass