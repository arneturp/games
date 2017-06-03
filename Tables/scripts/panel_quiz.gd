extends TextureFrame

var possible_tables = Globals.get("ENABLED_TABLES")
var answers = []
var correct_answer = null
var allow_input = false
var timer = null
var score = 0
var last_answer = null;

onready var sample_player = get_node("sample_player")
onready var lbl_question = get_node("lbl_question")
onready var lbl_score = get_node("lbl_score")
onready var lbl_highscore = get_node("lbl_highscore")
onready var btn_answer_1 = get_node("answer_1")
onready var btn_answer_2 = get_node("answer_2")
onready var btn_answer_3 = get_node("answer_3")
onready var btn_answer_4 = get_node("answer_4")


func _ready():
	randomize();
	
	Globals.set("SCORE", 0)
	Globals.set("ANSWERS_CORRECT", 0)
	Globals.set("ANSWERS_WRONG", 0)
	generate_table()
	
	# Create a timer
	timer = Timer.new()
	timer.connect("timeout", self, "_on_timer_timeout") 
	add_child(timer) #to process
	
	# Set highscore
	lbl_highscore.set_text("Best:" + str(get_node("/root/globals").get_highscore()))
	pass


func generate_table():
	var number_1 = possible_tables[randi() % possible_tables.size()]
	var number_2 = randi() % 11
	correct_answer = number_1 * number_2
	
	if (correct_answer == last_answer):
		generate_table()
	else:
		lbl_question.set_text(str(number_1) + " x " + str(number_2))
		generate_answers();
		
		# Adding answers to screen
		btn_answer_1.set_value(answers[0])
		btn_answer_2.set_value(answers[1])
		btn_answer_3.set_value(answers[2])
		btn_answer_4.set_value(answers[3])
		
		# Allow input
		allow_input = true
		last_answer = correct_answer
	
	
	pass

func generate_answers():
	var rand_int = randi() % 7
	
	if (correct_answer > 3):
		if (int(rand_int) < int(1)):
			answers = [correct_answer - 2, correct_answer, correct_answer + 2, correct_answer + 3]
		elif (int(rand_int) < int(2)):
			answers = [correct_answer - 3, correct_answer - 1, correct_answer, correct_answer + 3]
		elif (int(rand_int) < int(3)):
			answers = [correct_answer - 2, correct_answer, correct_answer + 2, correct_answer + 4]
		elif (int(rand_int) < int(4)):
			answers = [correct_answer - 3, correct_answer - 2, correct_answer, correct_answer + 4]
		elif (int(rand_int) < int(5)):
			answers = [correct_answer - 1, correct_answer, correct_answer + 1, correct_answer + 2]
		elif (int(rand_int) < int(6)):
			answers = [correct_answer - 3, correct_answer - 2, correct_answer, correct_answer + 2]
		elif (int(rand_int) < int(7)):
			answers = [correct_answer - 1, correct_answer, correct_answer + 2, correct_answer + 5]
	else:
		answers = [correct_answer, correct_answer + 1, correct_answer + 3, correct_answer + 4]
	
	answers = shuffle_array(answers)
	pass

func shuffle_array(list):
    var shuffledList = []
    var indexList = range(list.size())
    for i in range(list.size()):
        randomize()
        var x = randi()%indexList.size()
        shuffledList.append(list[x])
        indexList.remove(x)
        list.remove(x)
    return shuffledList

func _on_timer_timeout():
	generate_table()
	timer.stop()
	btn_answer_1.reset_animation()
	btn_answer_2.reset_animation()
	btn_answer_3.reset_animation()
	btn_answer_4.reset_animation()
	pass

func btn_pressed(ans):
	if (correct_answer == ans):
		correct_answer()
		timer.set_wait_time(0.7)
		timer.start()
	else:
		wrong_answer()
		timer.set_wait_time(1.4)
		timer.start()
	
	allow_input = false
	pass

func correct_answer():
	sample_player.play("correct_answer")
	Globals.set("SCORE", Globals.get("SCORE") + 1)
	lbl_score.set_text("Score: " + str(Globals.get("SCORE")))
	Globals.set("ANSWERS_CORRECT", Globals.get("ANSWERS_CORRECT") + 1)
	pass


func wrong_answer():
	sample_player.play("wrong_answer")
	if (Globals.get("SCORE") > 0):
		Globals.set("SCORE", Globals.get("SCORE") - 1)
	lbl_score.set_text("Score: " + str(Globals.get("SCORE")))
	Globals.set("ANSWERS_WRONG", Globals.get("ANSWERS_WRONG") + 1)
	pass

func _on_answer_1_button_down():
	if (allow_input == false):
		return
	btn_pressed(btn_answer_1.value)
	btn_answer_1.animate_pressed(true, correct_answer)
	btn_answer_2.animate_pressed(false, correct_answer)
	btn_answer_3.animate_pressed(false, correct_answer)
	btn_answer_4.animate_pressed(false, correct_answer)
	pass


func _on_answer_2_button_down():
	if (allow_input == false):
		return
	btn_pressed(btn_answer_2.value)
	btn_answer_1.animate_pressed(false, correct_answer)
	btn_answer_2.animate_pressed(true, correct_answer)
	btn_answer_3.animate_pressed(false, correct_answer)
	btn_answer_4.animate_pressed(false, correct_answer)
	pass


func _on_answer_3_button_down():
	if (allow_input == false):
		return
	btn_pressed(btn_answer_3.value)
	btn_answer_1.animate_pressed(false, correct_answer)
	btn_answer_2.animate_pressed(false, correct_answer)
	btn_answer_3.animate_pressed(true, correct_answer)
	btn_answer_4.animate_pressed(false, correct_answer)
	pass


func _on_answer_4_button_down():
	if (allow_input == false):
		return
	btn_pressed(btn_answer_4.value)
	btn_answer_1.animate_pressed(false, correct_answer)
	btn_answer_2.animate_pressed(false, correct_answer)
	btn_answer_3.animate_pressed(false, correct_answer)
	btn_answer_4.animate_pressed(true, correct_answer)
	pass
