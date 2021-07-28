extends MarginContainer

onready var up_label = $CenterContainer/VBoxContainer/Up
onready var left_label = $CenterContainer/VBoxContainer/HBoxContainer/Left
onready var right_label = $CenterContainer/VBoxContainer/HBoxContainer/Right
onready var down_label = $CenterContainer/VBoxContainer/Down


func _ready():
	_reset_labels()


func _process(delta):
	_check_input(up_label, "ui_up")
	_check_input(left_label, "ui_left")
	_check_input(right_label, "ui_right")
	_check_input(down_label, "ui_down")


func _check_input(label, key):
	if Input.is_action_just_pressed(key):
		_reset_labels()
		key.erase(0, 3)
		label.text = key


func _reset_labels():
	up_label.text = ""
	left_label.text = ""
	right_label.text = ""
	down_label.text = ""
