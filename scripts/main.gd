extends MarginContainer

onready var up_label = $CenterContainer/VBoxContainer/Up
onready var left_label = $CenterContainer/VBoxContainer/HBoxContainer/Left
onready var right_label = $CenterContainer/VBoxContainer/HBoxContainer/Right
onready var down_label = $CenterContainer/VBoxContainer/Down
onready var input_player = $InputSound
onready var beat_player = $Beat
onready var beat_timer = $BeatTimer

var up_bell = preload("res://sounds/c-bell.wav")
var left_bell = preload("res://sounds/d-bell.wav")
var right_bell = preload("res://sounds/e-bell.wav")
var down_bell = preload("res://sounds/f-sharp-bell.wav")

var bpm = 120
var section_time = 120 / 60
var input_allowed = false


func _ready():
	beat_timer.wait_time = section_time
	_reset_labels()


func _process(_delta):
	if input_allowed:
		_check_input()


func _check_input():
	_reset_labels()
	if Input.is_action_just_pressed("ui_up"):
		up_label.text = "up"
		input_player.stream = up_bell
		input_player.play()
	elif Input.is_action_just_pressed("ui_left"):
		left_label.text = "left"
		input_player.stream = left_bell
		input_player.play()
	elif Input.is_action_just_pressed("ui_right"):
		right_label.text = "right"
		input_player.stream = right_bell
		input_player.play()
	elif Input.is_action_just_pressed("ui_down"):
		down_label.text = "down"
		input_player.stream = down_bell
		input_player.play()


func _reset_labels():
	up_label.text = ""
	left_label.text = ""
	right_label.text = ""
	down_label.text = ""


func _on_BeatTimer_timeout():
	input_allowed = !input_allowed
	if !input_allowed:
		_reset_labels()
		beat_player.play()
