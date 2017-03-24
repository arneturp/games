extends TextureButton

onready var lbl = get_node("lbl")
onready var anim_player = get_node("anim_player")
onready var container = get_node("../")

var value = 0

func _ready():
	
	pass

func set_value(val):
	value = val
	lbl.set_text(str(val))
	pass

func animate_pressed(pressed, val):
	if (pressed == true):
		if (value == val):
			anim_player.play("correct")
		else:
			anim_player.play("wrong")
	else:
		if (value == val):
			anim_player.play("correct")
		else:
			anim_player.play("mute")
	pass

func reset_animation():
	anim_player.play("base")
	pass

