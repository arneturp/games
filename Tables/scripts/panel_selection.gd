extends TextureFrame

onready var btn_play = get_node("btn_play")
onready var btn_selection_1 = get_node("btn_selection_1")
onready var btn_selection_2 = get_node("btn_selection_2")
onready var btn_selection_3 = get_node("btn_selection_3")
onready var btn_selection_4 = get_node("btn_selection_4")
onready var btn_selection_5 = get_node("btn_selection_5")
onready var btn_selection_6 = get_node("btn_selection_6")
onready var btn_selection_7 = get_node("btn_selection_7")
onready var btn_selection_8 = get_node("btn_selection_8")
onready var btn_selection_9 = get_node("btn_selection_9")

var btns = null

func _ready():
	btns = [btn_selection_1, btn_selection_2, btn_selection_3, btn_selection_4, btn_selection_5, btn_selection_6, btn_selection_7, btn_selection_8, btn_selection_9]
	pass

func btn_selection_down():
	pass


func _on_btn_play_pressed():
	var active_tables = []
	for btn in btns:
		if btn.is_pressed():
			active_tables.push_back(btn.value)
	
	Globals.set("ENABLED_TABLES", active_tables)
	
	pass