extends StaticBody2D

onready var camera = get_node('../../camera')

var screen_height = Globals.get("display/height")

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if (get_pos().y > camera.get_global_pos().y + screen_height + 500):
		queue_free()
	pass
