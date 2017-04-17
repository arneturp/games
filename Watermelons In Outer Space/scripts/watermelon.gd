extends StaticBody2D

var speed = null

signal collected

func _ready():
	# Random rotation speed
	randomize()
	speed = rand_range(-20, 20)
	
	# Set fixed process
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	set_rotd(get_rotd() + (speed * delta))
	pass

func _collect_watermelon( body ):
	print(body.get_name())
	if (body.get_name() == "rocket"):
		print("Watermelon collected!")
		get_node("/root/globals").save_data.watermelons_collected += 1 
		get_node("/root/globals").save_game()
		queue_free()
		emit_signal("collected")
		
	pass # replace with function body
