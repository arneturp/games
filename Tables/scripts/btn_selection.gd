extends TextureButton

export var value = 0

var active = false

onready var lbl = get_node("lbl")
onready var parent = get_node("../")

func _ready():
	lbl.set_text(str(value))
	pass


func _on_btn_setting_button_down():
	
	parent.btn_selection_down()
	pass
