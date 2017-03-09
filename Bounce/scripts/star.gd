extends Node2D

onready var sample_player = get_node('sample_player')
onready var anim_player = get_node('anim_player')

var collected = false

func _ready():
	pass


func _on_area_2d_body_enter( body ):
	if (body.get_name() == "character" and collected == false):
		collected = true
		body.collect_star()
		sample_player.play("success")
		anim_player.play("pick_up")
	pass

func picked_up():
	queue_free()
	pass